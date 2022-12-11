{ config, pkgs, lib, ... }:

{
  gtk = {
    enable = true;
    font.name = "Terminus SemiBold 12";
    theme = {
      name = "Arc-Darker";
      package = pkgs.arc-theme;
    };

    iconTheme = {
      name = "Arc";
      package = pkgs.arc-icon-theme;
    };

    cursorTheme = {
      name = "Vanilla-DMZ";
      package = pkgs.vanilla-dmz;
    };
  };
}
