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
      name = "Pop";
      package = pkgs.pop-icon-theme;
    };

    cursorTheme = {
      name = "Bibata-Modern-Amber";
      package = pkgs.bibata-cursors;
    };
  };
}
