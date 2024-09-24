# Installation

## Frontend and backend

The ZK-SecreC compiler is divided into two parts called the frontend and the backend. The frontend contains a lexer, parser, type and effect checker, and a translator to a simpler intermediate language called Core ZK-SecreC. The frontend has been written in Haskell. The backend compiles the intermediate representation into Circuit-IR. The backend has been written in Rust. An intermediate part of the compiler, written in Haskell, generates Rust functions that, along with the compiler backend code, generate the compiled target code.

The backend of the ZK-SecreC compiler is also able to interface with ZKP protocol implementations like the EMP toolkit and Mac'n'Cheese.

## Building locally

Building locally is a good option if you wish to develop ZK-SecreC tools. The following steps
install the ZK-SecreC compiler and language server (but not Visual Studio Code
plugin).

The first step is to install the `stack` build tool. On Debian based distributions one can write:

`$ sudo apt install haskell-stack`

On macOS a fast way to get started is also to install `haskell-stack` using Homebrew:

`$ brew install haskell-stack`

If this leads to trouble, refer to the troubleshooting/installation guide at
`https://docs.haskellstack.org/en/stable/install_and_upgrade/##macos`

ZK-SecreC requires a relatively new version of `stack` (> 2). If your distribution
has an older version of `stack`, you can upgrade it with:

`$ stack upgrade`

and then add `~/.local/bin` to your `PATH`.

You can now compile and install the ZK-SecreC compiler frontend and language server with:

`$ stack install`

Stack will locally install the correct version of GHC for you before building.
If builds inexplicably start to fail during development, it can, in some situations,
be fixed with:

`$ stack clean && stack install`

It is possible to build the compiler frontend without installing using `stack build`. Repeating this command will recompile the compiler frontend if any code has been changed.

Using the ZK-SecreC compiler backend requires an installation of the Rust toolchain. The recommended method of installing it is by using [Rustup](https://rustup.rs/).

## Running tests

Unit tests of the Haskell part of the compiler can be run with:

`$ stack test --test-arguments "--color"`

## Using the compiler

The entrypoint to invoking the compiler is the script `runrust` in the 
repository root. The script generates the Rust source code, compiles it, and
executes the resulting binary which outputs the IR.

Usage instructions are provided by running the script without any arguments:

`$ ./runrust`

For example, to generate the Circuit-IR code out of the ZK-SecreC example code in `docs/example_sum.zksc`, one can run the command

`$ runrust docs/example_sum.zksc -p docs/example_sum_public.json -i docs/example_sum_instance.json -w docs/example_sum_witness.json -c docs/example_sum.ccc -o example_sum`

In the `.json` files, one passes the public, Verifier and Prover inputs to the program. The Verifier and Prover inputs are known as instance and witness, respectively. More precisely, these are non-expanded instance and witness; if expanded instance and witness are necessary, they must be programmed in the ZK-SecreC code. In the `.ccc` file, one provides configuration information telling the compiler which fields, plugins etc. are supported by the technology that is going to run the Circuit-IR code. Finally, the argument after the `-o` flag determines the names of the files where the compiler output will be written. In the current example, the Circuit-IR output is written in the file `example_sum.rel` in the compiler root directory. In addition, the files `example_sum_0.ins` and `example_sum_0.wit` will contain the instance and witness stream (if there were expanded instance and witness, the streams would include them, too). The suffix `0` denotes the index of the field (in the order of declaration in the head of the `.rel` file). If multiple fields were used then there would be one `.ins` and `.wit` file for each of them.

If public, Verifier an Prover inputs are provided in this order then the corresponding flags `-p`, `-i` and `-w` can be dropped. So the last command can be shortened as

`$ runrust docs/example_sum.zksc docs/example_sum_public.json docs/example_sum_instance.json docs/example_sum_witness.json -c docs/example_sum.ccc -o example_sum`

or, using regular expressions recognized by the shell, even as

`$ runrust docs/example_sum.zksc docs/example_sum_{public,instance,witness}.json -c docs/example_sum.ccc -o example_sum`

## Using the compiler frontend alone

Sometimes one wants to run the compiler frontend alone. This can be done using the command `zkscc`, provided that the compiler has been installed. Its short manual is output by

`$ zkscc --help`

For instance, in order to compile the file `docs/example_sum.zksc` with configuration (CCC) file `cfg/permitall.ccc` and generate output `example_sum.rs` into the compiler root directory, run

`$ zkscc docs/example_sum.zksc -c cfg/permitall.ccc -o example_sum.rs`

To do the same without having installed the compiler, one can write:

`$ stack run zkscc -- docs/example_sum.zksc -c cfg/permitall.ccc -o example_sum.rs`

Note the double dash which is required to separate arguments of `stack` from arguments of `zkscc`. 

This command will recompile the compiler if it has been changed. To do the same without recompiling, use `stack exec` in otherwise identical manner.

## ZK-SecreC vscode extension

The vscode extension adds syntax highlighting and language server integration.
Currently only syntax and typing errors are shown.

The vscode extension needs the `zksc-language-server` to be installed (see above).

### Building the VS Code extension

Install npm and node using [nvm](https://github.com/nvm-sh/nvm).
This is necessary as the version of `nodejs` that Ubuntu supplies is most likely too old.

Install project dependencies (in the `vscode-zksc` directory):

`$ npm ci`

Compile:

```bash
$ export NODE_OPTIONS=--openssl-legacy-provider
$ npm run package
```

Note that defining NODE_OPTIONS might not be necessary but it is required
with some older OpenSSL versions.

### Installing

1. Open the extensions manager in VS Code (shortcut: Ctrl + Shift + X).

1. Open the menu with the ellipsis icon (...) on the right of the EXTENSIONS
   title.

1. Choose "Install from VSIX...".

1. Locate the *.vsix file that you built and click Install.

### Configuring

1. Press Ctrl + , to open the settings.

1. Search for "zk-secrec". You will find ZK-SecreC extension configuration
   options.

1. Change the server path to where your zksc-language-server binary is. Note
   that there is no variable expansion here.

### Running in VS Code Extension Development mode

This is useful if you are developing the extension.

1. Open the project in VS Code.

1. Compile the extension using `npm run compile`.

1. In VS Code press F5 or click Run -> Start Debugging in the menu.

1. Choose VS Code Extension Development from the menu that opened.

Remember to configure the language server path before opening ZK-SecreC files.

If you make changes to the code you will have to recompile the program or use
`npm run watch`.

You can restart VS Code Extension Development mode using Ctrl + Shift + P and
searching for "Developer: Reload Window" in the opened menu.

### Known limitations

VS Code has a workspace concept. This extension currently only works if you
have one workspace which is likely to be sufficient for ZK-SecreC
programming. The extension is untested with multiple workspaces and is likely
to have bugs in that case.

## Building and using the "production" Docker image

The `Dockerfile` in the top-level directory builds a minimal docker image with
just the compiler.

Build the image:

`$ docker build -t zkscc .`

Save the image as .tar.gz file:

`$ docker save zkscc | gzip > zkscc.tar.gz`

The image can be re-created from the .tar.gz file using:

`$ docker load --input zkscc.tar.gz`

When running a container from the image you would probably want to access your
ZK-SecreC programs in the container. The simplest option for this is to use
[bind mounts](https://docs.docker.com/storage/bind-mounts/). Let's assume that
the local directory foo contains ZK-SecreC programs. Run a container using:

`$ docker run -it --rm -v "$(pwd)/foo":/zksc/workspace/foo zkscc /bin/bash`

The foo directory is now available in the working directory.

The image is bootstrapped with the Rust toolchain and the `runrust` script, so
the Rust compilation pipeline can also be run the same as locally.

The same container can be restarted if needed with `docker start` ` `*c* followed by `docker attach` ` `*c*, where *c* is the container identifier.

The Docker image can also be used non-interactively as a base image for other
application specific images (e.g. demonstrators).

## Using Visual Studio Code Docker dev container

This option is convenient if you wish to use the ZK-SecreC tools but not
necessarily develop them further. It gives you access to the ZK-SecreC compiler
and an IDE which you can use to develop proofs.

### Dependencies

* [Visual Studio Code](https://code.visualstudio.com/),
* [Docker](https://docs.docker.com/get-docker/).

### Installation steps

1. Open VS Code.
1. Open the Extensions panel using Ctrl + Shift + `X` or by clicking
   on the package icon in the left sidebar.
1. Search for "remote containers" and install the "Remote - Containers"
   extension.
1. Run `docker build -t zkscc .` in the repository root to build and tag the 
   dev container base image.

If you open the directory of this repository in VS Code it will now offer you
to open the directory in the dev container with ZK-SecreC tools.

After VS Code has opened the dev container it has installed the ZK-SecreC
extension as well. You can now work on `.zksc` files in the repository directory.

Open the panel (Ctrl + `J` or View -> Appearance -> Show Panel). Click on the
terminal tab. If no terminal is opened click the plus sign on the right of the
panel. You now have a shell running inside of the container and the repository
files are mounted in the container. To use the Rust compilation pipeline,
call the script included in the environment's path, e.g. `runrust`.

## EMP Backend

[EMP](https://github.com/emp-toolkit/emp-zk) is a ZK toolkit written in C++ which
allows a prover and verifier to perform arithmetic and boolean operations.
The "EMP backend" replaces SIEVE IR generation with calls to the emp backend code
instead, allowing an interactive execution session of the `.zksc` code using the emp runtime.

The way this works is through a small wrapper named `emp-wrapper` which exposes
the necessary functionality. Then, Rust bindings are generated for that wrapper using
`bindgen` which is then called by the generated Rust code.

### Installation

To install the EMP backend you need to compile the emp-wrapper library.
The build instructions for that are in the `./emp-wrapper` readme.

### Usage

The EMP backend can only be called through Rust via the `runrust` command.
Calling `./runrust` will show details of the available flags (notably `--emp`).
You will need two run two instances of the program, one with `--emp --prover`
and the other with `--emp --verifier`. Building the two instances of the program
nearly at the same time can result in them not successfully connecting.

If running EMP toolkit over the network, use the `--emp-addr` flag to specify address and port.

### Quirks

`emp-toolkit` has two kinds of integers: bit vectors and fixed-precision integers.
The current EMP backend as of 2022-08-15 only has bindings for the fixed-precision kind,
which operates in the Mersenne61 modulus. For larger numbers you can use the `BigInt.zksc` module from the standard library.

Booleans are also encoded as M61 integers, and logical operations are done through
arithmetic ones. This means that in efficiency they are ranked as: `and`, `>>`, `or`, `>>>>`, `xor`.

## Acknowledgements

ZK-SecreC design and tool development has been funded by the Defense Advanced Research Projects Agency (DARPA) under contract HR0011-20-C-0083. The views, opinions, and/or findings expressed are those of the author(s) and should not be interpreted as representing the official views or policies of the Department of Defense or the U.S. Government. Distribution Statement "A" (Approved for Public Release, Distribution Unlimited).

