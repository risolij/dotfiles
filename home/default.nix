{ pkgs, inputs, username, ... }:
{
    imports = [
        inputs.noctalia.homeModules.default
        inputs.niri.homeModules.niri
        inputs.stylix.homeModules.stylix
        inputs.nixvim.homeModules.nixvim
        ./programs
        ./services
    ];

    home.stateVersion = "23.05";

    home.sessionVariables = {
        EDITOR = "nvim";
        TERMINAL = "alacritty";
        BROWSER = "firefox";
        XDG_PICTURES_DIR = "/home/${username}/Pictures";
        XDG_SESSION_TYPE = "wayland";
        XDG_SESSION_DESKTOP = "niri-session";
        XDG_CURRENT_DESKTOP = "niri-session";
        MOZ_ENABLE_WAYLAND = "1";
        NIXOS_XDG_OPEN_USE_PORTAL = "1";
        GDK_BACKEND = "wayland";
        GTK_USE_PORTAL = "1";
        QS_ICON_THEME="Numix-Square";
        GTK_THEME = "Tokyonight-Dark";
        XDG_ICON_THEME = "Numix Square";
    };

    home.username = username;
    manual.manpages.enable = true;
    fonts.fontconfig.enable = true;
    dconf.enable = true;

    nixpkgs.config.allowUnfree = true;
}
