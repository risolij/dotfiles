{ inputs, config, pkgs, lib, ... }:

{
  gtk = {
    enable = true;

    font = {
      name = "Sans";
      size = 11;
    };

    theme = {
      name = "Tokyonight-Dark";
      package = pkgs.tokyonight-gtk-theme;
    };

    iconTheme = {
      name = "Numix-Square";
      package = pkgs.numix-icon-theme-square;
    };

    cursorTheme = {
      name = "Bibata-Modern-Amber";
      package = pkgs.bibata-cursors;
    };
  };
  qt.platformTheme.name = "gtk";
}
