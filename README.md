# haskell-nix-cookiecutter

## Features

- cabal
- stack
- nix + niv
- direnv
- hoogle
- tests with markdown-unlit
- a Makefile with some helpers

## Usage

Run

```
cookiecutter gh:alexpeits/haskell-nix-cookiecutter
```

in the directory where you want the package to be created in.

If you're using nix, `cookiecutter` is available so you can run

```
nix-shell -p cookiecutter
```

before running the command above.
