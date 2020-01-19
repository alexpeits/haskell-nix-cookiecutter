# to see ghc versions:
# nix-instantiate --eval -E "with import ./nix/nixpkgs.nix {}; lib.attrNames haskell.compiler"
{ pkgs ? null, compiler ? null, withHoogle ? true }:

let

  nixpkgs = if isNull pkgs then
    import (import ./nix/sources.nix).nixos-stable { }
  else if builtins.typeOf pkgs == "set" then
    pkgs
  else
    import (builtins.getAttr pkgs (import ./nix/sources.nix)) { };

  inShell = nixpkgs.lib.inNixShell;

  haskellPackagesNoHoogle = if isNull compiler then
    nixpkgs.haskellPackages
  else
    nixpkgs.haskell.packages.${compiler};

  haskellPackagesWithHoogle = haskellPackagesNoHoogle.override {
    overrides = (self: super: {
      ghc = super.ghc // { withPackages = super.ghc.withHoogle; };
      ghcWithPackages = self.ghc.withPackages;
    });
  };

  haskellPackages = if (inShell && withHoogle) then
    haskellPackagesWithHoogle
  else
    haskellPackagesNoHoogle;

  src = nixpkgs.nix-gitignore.gitignoreSource [ ] ./.;

  overrides = import ./nix/overrides.nix {
    pkgs = nixpkgs;
    haskellPackages = haskellPackages;
  };

  drv = haskellPackages.callCabal2nix "{{cookiecutter.package_name}}" src overrides;

  shell = nixpkgs.mkShell {
    inputsFrom = [ drv.env ];
    buildInputs = [ haskellPackages.ghcid haskellPackages.cabal-install ];
  };

in if inShell then shell else drv
