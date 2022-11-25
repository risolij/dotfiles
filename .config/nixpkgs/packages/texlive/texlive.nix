{ config, pkgs, ... }:

{
  programs.texlive = {
    enable = true;
    extraPackages = tpkgs: {
      inherit (tpkgs)
        ## apa7
        ## apacite
        biblatex
        capt-of
        enumitem
        environ
        hyperref
        ifmtarg
        paralist
        scheme-medium
        sourcesanspro
        tcolorbox
        wrapfig
        xifthen
        heuristica
        fourier
        xurl;
    };
  };
}

