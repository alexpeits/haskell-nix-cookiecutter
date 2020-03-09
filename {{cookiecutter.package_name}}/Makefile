.PHONY: ghcid

NIV_VERSION?={{cookiecutter.nixpkgs}}
HOOGLE_PORT?=8888
DOCS_PORT?=9999

cabal-configure:
	nix-shell --argstr pkgs ${NIV_VERSION} --command 'cabal new-configure -w $$(which ghc)'

ghcid:
	ghcid -a --command='cabal new-repl' --restart={{cookiecutter.package_name}}.cabal

ghcid-stack:
	ghcid -a --command='stack ghci -- src/**/*.hs'

dist:
	cabal new-sdist

haddock:
	cabal new-haddock --haddock-options="--show-all --hyperlinked-source"

haddock-hackage:
	cabal new-haddock --haddock-options="--show-all --hyperlinked-source" --haddock-for-hackage

hoogle:
	hoogle server --port ${HOOGLE_PORT} --local

serve-docs:
	cd docs/ && nix-shell -p python3 --command 'python3 -m http.server ${DOCS_PORT}'

list-ghcs:
	nix-instantiate --eval -E "with import (import ./nix/sources.nix).${NIV_VERSION} {}; lib.attrNames haskell.compiler"
