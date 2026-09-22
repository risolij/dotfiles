{ pkgs, lib, stylix, ... }:
{
    stylix = {
        enable = true;
        polarity = "dark";
        opacity.terminal = 0.95;
        targets = {
            gtk = {
                enable = true;
                flatpakSupport.enable = true;
            };

            firefox = {
                enable = true;
                profileNames = [ "default" ];
                colorTheme.enable = true;
                firefoxGnomeTheme.enable = true;
            };

            rofi.enable = false;
            noctalia.enable = false;
            nixvim.enable = true;
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

        base16Scheme = "${pkgs.base16-schemes}/share/themes/tokyo-night-dark.yaml";
    };
}
