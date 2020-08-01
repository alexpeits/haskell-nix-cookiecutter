{ pkgs, self, super }:

let

  noTest = pkgs.haskell.lib.dontCheck;
  noHaddock = pkgs.haskell.lib.dontHaddock;

in

{}

# example:

# let
#
#   something-src = pkgs.fetchFromGitHub {
#     owner = "<owner>";
#     repo = "<repo>";
#     rev = "<commit sha>";
#     sha256 = "<sha256>";
#   };
#
# in { something = self.callCabal2nix "something" something-src { }; }
