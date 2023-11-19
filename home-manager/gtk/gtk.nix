{ config, pkgs, lib, ... }:

{
  gtk = {
    enable = true;
    font.name = "Ubuntu Monospace 16";
    theme = {
      name = "Arc-Darker";
      package = pkgs.arc-theme;
    };

    iconTheme = {
      name = "Arc-Darker";
      package = pkgs.arc-theme;
    };

    cursorTheme = {
      name = "Arc-Darker";
      package = pkgs.arc-theme;
    };
  };
}
