# Documentation on the ZK-SecreC Compiler, Language and Standard Library

This documentation can be served using the Pandora server that is also developed in Cybernetica. Nevertheless, it is possible to get it work with MkDocs. We have uploaded the `docs` directory produced by MkDocs along with its contents, so the user can in principle open the documentation HTML files directly with a web browser. (As MkDocs does not understand the yaml encoding of API description, the files in the `4-api` subdirectory have been replaced by those produced by Pandora and made all links work by redirecting them using `sed -Ei`.)

Having the Pandora server installed, serving the documentation can be done by just running the `pandora` program in the root folder of this project and entering `localhost:8000` to the address bar of the web browser.

## Pandora

Pandora is a web server for serving static content. It uses the Haskell Pandoc library to convert between different document formats.

To build Pandora, first download the latest version of Stack (see [the Stack manual](https://docs.haskellstack.org/en/stable/README/#how-to-install)). Run `stack install` in the root folder of the project to build an executable. Make sure that the PATH varibale points to the directory where Stack installs programs.

## Acknowledgements

ZK-SecreC design and tool development has been funded by the Defense Advanced Research Projects Agency (DARPA) under contract HR0011-20-C-0083. The views, opinions, and/or findings expressed are those of the author(s) and should not be interpreted as representing the official views or policies of the Department of Defense or the U.S. Government. Distribution Statement "A" (Approved for Public Release, Distribution Unlimited).

