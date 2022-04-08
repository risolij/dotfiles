{ config, pkgs, ... }:

{
  programs.texlive = {
    enable = true;
    extraPackages = tpkgs: {
      inherit (tpkgs)
        ## apa7
        wrapfig
        capt-of
        paralist
        ## apacite
        hyperref
        biblatex
        scheme-medium;
    };
  };
}

