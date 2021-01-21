let 
  nixpkgs = import <nixpkgs> {};
in
  with nixpkgs;
  stdenv.mkDerivation {
    name = "cry-env";
    buildInputs = [ 
      cargo
      rustup
      rustc
      pkgconfig
      openssl.dev 
      nix
      ];
    OPENSSL_DEV=openssl.dev;
  }
