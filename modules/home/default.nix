{ config, pkgs, lib, inputs, ... }:
let
  username = "req";
in
{
  imports = [
    inputs.noctalia.homeModules.default
    inputs.niri.homeModules.niri
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
    XDG_SESSION_DESKTOP = "niri";
    XDG_CURRENT_DESKTOP = "niri";
    MOZ_ENABLE_WAYLAND = "1";
    GDK_BACKEND = "wayland";
    GTK_USE_PORTAL = "1";
    NIXOS_XDG_OPEN_USE_PORTAL = "1";
  };

  home.username = username;
  home.pointerCursor = {
    gtk.enable = true;
    package = pkgs.bibata-cursors;
    name = "Bibata-Modern-Amber";
    size = 32;
  };

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
