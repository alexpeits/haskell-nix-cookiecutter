# haskell-nix-cookiecutter

[![Build Status](https://img.shields.io/endpoint.svg?url=https%3A%2F%2Factions-badge.atrox.dev%2Falexpeits%2Fhaskell-nix-cookiecutter%2Fbadge&style=flat)](https://actions-badge.atrox.dev/alexpeits/haskell-nix-cookiecutter/goto)

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
