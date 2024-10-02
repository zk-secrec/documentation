{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE TemplateHaskell #-}

module Main where

import English

import Control.Lens hiding (levels, (|>))
import Control.Monad
import Control.Monad.Reader
import Control.Monad.State
import Control.Monad.IO.Class

import Data.Aeson
import qualified Data.ByteString as BS
import Data.Char
import Data.Conduit
import Data.Default
import Data.Foldable
import qualified Data.Text as T
import Data.Text.Encoding (decodeUtf8)
import Data.Tree
import qualified Data.Map.Strict as M
import Data.List
import Data.Maybe
import Data.String (IsString(..))

import Network.Wai
import Network.Wai.Handler.Warp (run)
import Network.HTTP.Types

import Options.Applicative

import System.Directory
import System.Exit (die)
import System.FilePath

import Text.Pandoc
import Text.Pandoc.Sources
import qualified Text.DocTemplates as D

import Twitch hiding (run)
import qualified Twitch as TW

makeLensesFor 
  [ ("writerTemplate", "writerTemplateL")
  , ("writerListings", "writerListingsL")
  , ("writerVariables", "writerVariablesL")
  , ("writerExtensions", "writerExtensionsL")
  ] ''WriterOptions

makeLensesFor
  [ ("readerExtensions", "readerExtensionsL")
  ] ''ReaderOptions

data PandoraOptions = PandoraOptions
  { _optPort :: Int
  }

makeLenses ''PandoraOptions

optsParser :: Parser PandoraOptions
optsParser = PandoraOptions
  <$> option auto 
      ( long "port"
     <> short 'p'
     <> metavar "PORT"
     <> help "Port number for serving the documentation"
     <> value 8000
      )

data PandoraState = PandoraState
  { _psTree :: Tree FilePath
  , _psOptions :: PandoraOptions
  }

makeLenses ''PandoraState

type PandoraM a = ReaderT PandoraState PandocIO a

runPandora :: PandoraM a -> PandoraState -> IO a
runPandora x st = runIOorExplode $ runReaderT x st

sourceDir
  = "docs-md"
fontsDir
  = "fonts"
styleDir
  = "css"
templateDir
  = "templates"
targetDir
  = "build"

capitalize
  :: T.Text -> T.Text
capitalize t
  = case T.uncons t of
      Just (c , t')
        -> T.cons (toUpper c) t'
      _ -> T.empty

capitalizeIfNeeded
  :: [T.Text] -> [T.Text]
capitalizeIfNeeded ws
  = case ws of
      w : rest
        -> capitalize w : fmap (\ w -> if w `elem` concat [articles, prepositions, conjunctions] then w else capitalize w) rest
      _ -> []

prettyName :: T.Text -> T.Text
prettyName = T.unwords .
             capitalizeIfNeeded . -- T.toTitle converts characters in the middle of the word to lower case. We want to avoid this.
             T.words . 
             T.replace "-" " " . 
             T.takeWhile (/= '.') . 
             T.dropWhile (\c -> isDigit c || c == '-')

getFirstPage :: Tree FilePath -> FilePath -> Maybe FilePath
getFirstPage tree path = do
  let subTree t = if rootLabel t == path
                    then Just t
                    else case subForest t of
                      [] -> Nothing
                      cs -> asum $ subTree <$> cs
  sub <- subTree tree
  find (isExtensionOf "md") $ toList sub

getVarContext :: PandoraM (D.Context T.Text)
getVarContext = do
  tree <- view psTree
  let toc = D.ListVal . catMaybes $ do
        let enumerate i (Node a cs) = Node (a, i) $ enumerate (i+1) <$> cs
        (x, i) <- toList $ enumerate 0 tree
        if takeFileName x == "index.md"
          then return Nothing
          else do
            let name = T.pack . last $ splitPath x
            let htmlPath = if hasExtension x
                             then Just x
                             else getFirstPage tree x
            let path = case htmlPath of
                         Just x  -> T.pack . (`replaceExtension` "html") . joinPath . ("/":) . tail $ splitPath x
                         Nothing -> ""
            return . Just . D.MapVal . D.Context $ M.fromList
              [ ("level", D.SimpleVal . D.Text 10 $ "toc-level-" <> T.pack (show i))
              , ("path", D.SimpleVal $ D.Text 10 path)
              , ("name", D.SimpleVal . D.Text 10 $ prettyName name)
              ]
  return . D.Context $ M.fromList
    [ ("toc", toc)
    ]

copyDirectory :: FilePath -> FilePath -> IO ()
copyDirectory from to = do
  createDirectoryIfMissing False to
  contents <- listDirectory from
  for_ contents $ \p -> do
    let fromPath = from </> p
    let toPath = to </> p
    isDir <- doesDirectoryExist fromPath
    if isDir
      then do
        createDirectoryIfMissing False toPath
        copyDirectory fromPath toPath
      else do
        copyFile fromPath toPath

listDirectorySorted :: FilePath -> IO [FilePath]
listDirectorySorted path = do
  ls <- listDirectory path
  return $ sortOn (fmap toLower) ls

dirTree :: FilePath -> IO (Tree FilePath)
dirTree path = do
  isDir <- doesDirectoryExist path
  if isDir
    then do
      contents <- listDirectorySorted path
      subTrees <- traverse dirTree $ (path </>) <$> contents
      return $ Node path subTrees
    else return $ Node path []

buildTree :: Tree FilePath -> PandoraM ()
buildTree tree = do
  let filePath = rootLabel tree
  liftIO . putStrLn $ "Compling: " <> filePath
  let buildPath = joinPath . (targetDir :) . drop 1 $ splitPath filePath
  liftIO . putStrLn $ "Build path: " <> buildPath
  let isDir = not . null $ subForest tree
  if isDir
    then liftIO $ createDirectoryIfMissing True buildPath
    else compileFile filePath buildPath
  traverse_ buildTree $ subForest tree

loadTemplate :: IO (Template T.Text)
loadTemplate = do
  let mainFile = templateDir </> "main.html"
  template <- BS.readFile mainFile
  res <- compileTemplate (dropFileName mainFile) (decodeUtf8 template)
  either die return res

pandoraExtensions = pandocExtensions <> extensionsFromList
  [ Ext_yaml_metadata_block
  ]

readMap
  :: (PandocMonad m, ToSources a)
  => M.Map String (ReaderOptions -> a -> m Pandoc)
readMap
  = M.fromList $
    [ (".md" , readMarkdown)
    , (".tex" , readLaTeX)
    , (".html" , readHtml)
    ]

compileFile :: FilePath -> FilePath -> PandoraM ()
compileFile filePath buildPath = 
  case M.lookup (takeExtension filePath) readMap of
    Just read
      -> do
           let buildPath' = replaceExtension buildPath "html"
           input <- liftIO $ BS.readFile filePath
           let inConf = def & readerExtensionsL .~ pandoraExtensions
           pandoc <- read inConf $ decodeUtf8 input
           template <- liftIO loadTemplate
           context <- getVarContext
           let outConf = def & writerTemplateL ?~ template
                             & writerListingsL .~ True
                             & writerVariablesL <>~ context
                             & writerExtensionsL .~ pandoraExtensions
           output <- writeHtml5String outConf pandoc
           liftIO . writeFile buildPath' $ T.unpack output
    _ -> return ()

tryPages :: FilePath -> IO (Maybe FilePath)
tryPages path = do
  let variants = 
        [ path
        , path</>"index.html"
        ]
  res <- forM variants $ \p -> do
        exists <- doesFileExist p
        if exists
          then return $ Just p
          else return Nothing
  return $ asum res

pandoraHeader :: [Header]
pandoraHeader =
  [ (hContentType, "text/html; charset=utf-8")
  ]

app :: Application
app req respond = do
  page <- tryPages path
  case page of
    Just p -> respond $ responseFile status200 pandoraHeader p Nothing
    Nothing -> do
      page404exists <- doesFileExist page404
      if page404exists
        then respond $ responseFile status404 pandoraHeader page404 Nothing
        else respond $ responseFile status404 pandoraHeader path Nothing
  where
    path = joinPath $ targetDir : fmap T.unpack (pathInfo req)
    page404 = targetDir </> "404.html"

compileAll :: PandoraOptions -> IO ()
compileAll opts = do
  tree <- dirTree sourceDir
  let state = PandoraState tree opts

  createDirectoryIfMissing False targetDir

  cssDirExists <- doesDirectoryExist styleDir
  when cssDirExists $ copyDirectory styleDir (targetDir </> styleDir)

  fontDirExists <- doesDirectoryExist fontsDir
  when fontDirExists $ copyDirectory fontsDir (targetDir </> fontsDir)

  runPandora (buildTree tree) state

runWatcher :: PandoraOptions -> IO ()
runWatcher opts = void . TW.run $ do
  let rebuildAll p = do
        putStrLn $ "File changed: " <> p
        putStrLn "Recompiling everything.."
        compileAll opts
  fromString (sourceDir </> "**/*.md")  |> rebuildAll
  fromString (sourceDir </> "**/*.tex") |> rebuildAll
  fromString (styleDir </> "**/*.css")  |> rebuildAll

main :: IO ()
main = do
  let opts' = info (optsParser <**> helper)
        ( fullDesc
       <> progDesc "Documentation generator"
       <> header "pandora - a documentation generator"
        )
  opts <- execParser opts'

  compileAll opts
  runWatcher opts

  let port = opts ^. optPort
  putStrLn $ "Serving documentation on port " <> show port
  run port app

