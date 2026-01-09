{ pkgs, lib, stylix, ... }:
{
  stylix = {
    enable = true;
    polarity = "dark";
    targets = {
      gtk.enable = true;
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
    };

    icons = {
      enable = true;
      dark = "Numix Square";
      light = "Numix Square Light";
      package = pkgs.numix-icon-theme-square;
    };

    cursor = {
      name = "Bibata-Modern-Amber";
      package = pkgs.bibata-cursors;
      size = 32;
    };

    base16Scheme = "${pkgs.base16-schemes}/share/themes/dracula.yaml";
  };
}
