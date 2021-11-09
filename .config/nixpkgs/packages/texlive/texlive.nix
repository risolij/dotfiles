{ config, pkgs, ... }:

{
  programs.texlive = {
    enable = true;
    extraPackages = tpkgs: {
      inherit (tpkgs)
        wrapfig
        capt-of
        paralist
        scheme-medium;
    };
  };
}

