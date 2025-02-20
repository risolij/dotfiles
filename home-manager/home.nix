{ config, pkgs, lib, ... }:

{
  ## Enable Home Manager
  programs.home-manager.enable = true;

  ## Enable manual manpages
  manual.manpages.enable = true;

  ## enable fontconfig
  fonts.fontconfig.enable = true;

  ## enable dconf
  dconf.enable = true;

  home = {
    stateVersion = "23.05";
    username = "req";
    homeDirectory = "/home/req";
    sessionVariables = {
      EDITOR = "nvim";
      TERMINAL = "alacritty";
      BROWSER = "firefox";
      GRIM_DEFAULT_DIR = "/home/req/Pictures/screenshots";
      XDG_PICTURES_DIR = "/home/req/Pictures";
      XDG_SESSION_TYPE = "wayland";
      XDG_SESSION_DESKTOP = "Hyprland";
      XDG_CURRENT_DESKTOP = "Hyprland";
      MOZ_ENABLE_WAYLAND = "1";
      GDK_BACKEND = "wayland";
      GTK_USE_PORTAL = "1";
      NIXOS_XDG_OPEN_USE_PORTAL = "1";
    };

    pointerCursor = {
      gtk.enable = true;
      package = pkgs.bibata-cursors;
      name = "Bibata-Modern-Amber";
      size = 32;
    };

    packages = with pkgs; [
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
      grim
      slurp

      ## Fonts && Themes
      nerd-fonts.fira-code
      nerd-fonts.jetbrains-mono
      inconsolata
      font-awesome

      ## Audio Tools
      pavucontrol
      pulsemixer
    ];
  };

  imports = [
    ./programs
    ./services
  ];
}
