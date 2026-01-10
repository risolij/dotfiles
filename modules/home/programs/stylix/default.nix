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


    base16Scheme = {
      base00 = "#191523";
      base01 = "#8d6bc4";
      base02 = "#675690";
      base03 = "#7965a9";
      base04 = "#68519d";
      base05 = "#d6cfdb";
      base06 = "#b573b4";
      base07 = "#000000";
      base08 = "#f070a3";
      base09 = "#d6cfdb";
      base0A = "#fa3d7c";
      base0B = "#5d37e6";
      base0C = "#8572e6";
      base0D = "#8773b5";
      base0E = "#363452";
      base0F = "#ffffff";
    };

    ## base16Scheme = "${pkgs.base16-schemes}/share/themes/dracula.yaml";
  };
}
