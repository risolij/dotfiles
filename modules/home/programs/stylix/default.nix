{ pkgs, lib, stylix, ... }:
{
  stylix = {
    enable = true;
    polarity = "dark";
    targets = {
      gtk = {
        enable = true;
        flatpakSupport.enable = true;
      };
      firefox = {
        profileNames = [ "default" ];
        colorTheme.enable = true;
      };
      noctalia-shell.enable = false;
    };

    fonts = {
      sizes.terminal = 14;
      monospace = {
        package = pkgs.nerd-fonts.fira-code;
        name = "FiraCode Nerd Font";
      };

      sansSerif = {
        package = pkgs.dejavu_fonts;
        name = "DejaVu Sans";
      };

      serif = {
        package = pkgs.dejavu_fonts;
        name = "DejaVu Serif";
      };
    };

    icons = {
      enable = true;
      dark = "Dracula";
      light = "Dracula";
      package = pkgs.dracula-icon-theme;
    };

    cursor = {
      name = "Bibata-Modern-Amber";
      package = pkgs.bibata-cursors;
      size = 32;
    };

    base16Scheme = "${pkgs.base16-schemes}/share/themes/dracula.yaml";
  };
}
