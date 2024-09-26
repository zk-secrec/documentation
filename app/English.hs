{-# LANGUAGE OverloadedStrings #-}
module English (articles, prepositions, conjunctions) where


import Data.Text


articles
  :: [Text]
articles
  = [ "a"
    , "an"
    , "the"
    ]

prepositions
  :: [Text]
prepositions
  = [ "about"
    , "above"
    , "across"
    , "after"
    , "against"
    , "along"
    , "among"
    , "around"
    , "as"
    , "at"
    , "before"
    , "behind"
    , "below"
    , "beneath"
    , "beside"
    , "between"
    , "beyond"
    , "by"
    , "despite"
    , "down"
    , "during"
    , "except"
    , "for"
    , "from"
    , "in"
    , "inside"
    , "into"
    , "like"
    , "near"
    , "of"
    , "off"
    , "on"
    , "onto"
    , "opposite"
    , "out"
    , "outside"
    , "over"
    , "past"
    , "round"
    , "since"
    , "than"
    , "through"
    , "to"
    , "towards"
    , "under"
    , "underneath"
    , "unlike"
    , "until"
    , "up"
    , "upon"
    , "via"
    , "with"
    , "within"
    , "without"
    ]

coordinating
  :: [Text]
coordinating
  = [ "for"
    , "and"
    , "nor"
    , "but"
    , "or"
    , "yet"
    , "so"
    ]

subordinating
  :: [Text]
subordinating
  = [ "once"
    , "although"
    , "after"
    , "as"
    , "while"
    , "when"
    , "whereas"
    , "whenever"
    , "whether"
    , "how"
    , "if"
    , "though"
    , "because"
    , "before"
    , "until"
    , "unless"
    , "since"
    , "so"
    ]

correlative
  :: [Text]
correlative
  = [ "as"
    , "both"
    , "either"
    , "whether"
    , "neither"
    , "not"
    , "such"
    , "scarcely"
    , "rather"
    ]

conjunctions
  :: [Text]
conjunctions
  = coordinating ++ subordinating ++ correlative


