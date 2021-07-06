let 
  nixpkgs = import <nixpkgs> {};
in
  with nixpkgs;
  stdenv.mkDerivation {
    name = "cry-env";
    buildInputs = [ 
      cargo
      rustup
      rustfmt
      rustc
      pkgconfig
      openssl.dev 
      nix
      python3
      glib
      cairo
      pango
      xorg.xmodmap
      ];
    OPENSSL_DEV=openssl.dev;
  }
