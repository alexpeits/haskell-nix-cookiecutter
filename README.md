# haskell-nix-cookiecutter

## Usage

Run

```
cookiecutter gh:alexpeits/haskell-nix-cookiecutter
```

in the directory where you want the package to be created in. This will prompt
for some information like package name, repo name and author info and will
generate the project with the appropriate details filled in.

If you're using nix, `cookiecutter` is available so you can run

```
nix-shell -p cookiecutter
```

before running the command above.

## Features

- cabal
- stack
- nix + niv
- direnv
- docsify
- hoogle
- tests with markdown-unlit
- a Makefile with some helpers
