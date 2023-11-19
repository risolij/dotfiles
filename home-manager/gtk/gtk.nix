{ config, pkgs, lib, ... }:

{
  gtk = {
    enable = true;
    font = {
      name = "Sans";
      size = 11;
    };
    theme = {
      name = "Arc-Darker";
      package = pkgs.arc-theme;
    };
    iconTheme = {
      name = "breeze-dark";
      package = pkgs.libsForQt5.breeze-icons;
    };

    ## cursorTheme = {
    ##   name = "Arc-Darker";
    ##   package = pkgs.arc-theme;
    ## };
  };
}
