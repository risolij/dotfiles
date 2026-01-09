{ config, pkgs, lib, inputs, username, ... }:
let
  noctalia = inputs.noctalia.homeModules.default;
  niri = inputs.niri.homeModules.niri;
  stylix = inputs.stylix.homeModules.stylix;
in
{
  imports = [
    stylix
    noctalia
    niri
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

  home.packages = with pkgs; [
      ## Hardware Tools
      acpi
      dmidecode
      inxi
      pciutils
      usbutils
      lm_sensors
      ethtool

      ## Networking Tools
      dig
      lsof
      nmap
      tcpdump

      ## Security Tools
      vulnix
      lynis

      ## Notifications
      libnotify

      ## Image Tools
      imagemagick

      ## Fonts && Themes
      nerd-fonts.fira-code
      nerd-fonts.jetbrains-mono
      inconsolata
      font-awesome
      numix-icon-theme-square

      ## Audio Tools
      pavucontrol
      pulsemixer

      ## Ledger
      ledger-live-desktop
      trezor-suite

      ## Other
      mpv

      ## Wayland Package for Niri
      xwayland-satellite
  ];

  ## Enable manual manpages
  manual.manpages.enable = true;

  ## enable fontconfig
  fonts.fontconfig.enable = true;

  ## enable dconf
  dconf.enable = true;

  nixpkgs.config.allowUnfree = true;
}
