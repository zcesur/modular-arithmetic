{ sources ? import nix/sources.nix {} }:
let
  haskellNix = import sources."haskell.nix" {};
  pkgs = import haskellNix.sources.nixpkgs-2003 haskellNix.nixpkgsArgs;
in
pkgs.haskell-nix.project {
  src = pkgs.haskell-nix.haskellLib.cleanGit {
    name = "modular-arithmetic";
    src = ./.;
  };
  compiler-nix-name = "ghc884";
}
