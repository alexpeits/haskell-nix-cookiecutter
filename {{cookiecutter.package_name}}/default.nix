# to see ghc versions:
# nix-instantiate --eval -E "with import ./nix/nixpkgs.nix {}; lib.attrNames haskell.compiler"
{ pkgs ? null, compiler ? null, withHoogle ? true }:

let

  nixpkgs = if isNull pkgs then
    import (import ./nix/sources.nix).{{cookiecutter.nixpkgs}} {}
  else if builtins.typeOf pkgs == "set" then
    pkgs
  else
    import (builtins.getAttr pkgs (import ./nix/sources.nix)) {};

  # changing compilers might lead to building everything, beware
  haskellPackagesBase = if isNull compiler then
    nixpkgs.haskellPackages
  else
    nixpkgs.haskell.packages.${compiler};

  haskellPackages = haskellPackagesBase.override {
    overrides = self: super:
      let
        hsPkgs = import ./nix/overrides.nix {
          pkgs = nixpkgs;
          self = self;
          super = super;
        };
        src = nixpkgs.nix-gitignore.gitignoreSource [] ./.;
        drv = self.callCabal2nix "{{cookiecutter.package_name}}" src {};
      in
        hsPkgs // { {{cookiecutter.package_name}} = drv; };
  };

  shell = haskellPackages.shellFor {
    packages = ps: [ ps.{{cookiecutter.package_name}} ];
    buildInputs = [ haskellPackages.ghcid haskellPackages.cabal-install ];
    withHoogle = withHoogle;
  };

in

if nixpkgs.lib.inNixShell
then shell
else haskellPackages.{{cookiecutter.package_name}}
