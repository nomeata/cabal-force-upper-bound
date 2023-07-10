with import (builtins.fetchTarball https://github.com/NixOS/nixpkgs/archive/6fb7c460bab8d17009a5a50d6ca9e65d6245b677.tar.gz) { };
stdenv.mkDerivation rec {
  name = "env";
  buildInputs = [
    haskell.compiler.ghc8107
    haskell.compiler.ghc902
    haskell.compiler.ghc924
    haskell.compiler.ghc925
    haskell.compiler.ghc944
    haskell.compiler.ghc962
    ghcid
    haskellPackages.cabal-plan-bounds
  ];
}
