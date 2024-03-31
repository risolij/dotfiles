{ config, pkgs, lib, ... }:

{
  ## Enable Home Manager
  programs.home-manager.enable = true;

  ## Enable manual manpages
  manual.manpages.enable = true;

  ## enable fontconfig
  fonts.fontconfig.enable = true;

  nixpkgs.config = {
    allowUnfree = true;
  };


  home = {
    stateVersion = "23.05";
    username = "req";
    homeDirectory = "/home/req";
    sessionVariables = {
      EDITOR = "nvim";
      TERMINAL = "alacritty";
      BROWSER = "firefox";

      ## Testing environment variables
      XDG_SESSION_TYPE = "wayland";
      XDG_SESSION_DESKTOP = "Hyprland";
      XDG_CURRENT_DESKTOP = "Hyprland";
      MOZ_ENABLE_WAYLAND = "1";
      GDK_BACKEND = "wayland";
      GTK_USE_PORTAL = 0;
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

      ## Notification Tools
      dzen2
      libnotify
      wlogout

      ## Networking Tools
      dig
      lsof
      nmap
      tcpdump

      ## Security Tools
      vulnix

      ## Development Tools
      virt-manager 

      ## Image Tools
      imagemagick
      grim
      slurp
      cava
      hyprpaper

      ## Fonts && Themes
      font-awesome
      ubuntu_font_family

      ## Audio Tools
      pavucontrol
      pulsemixer

      ## runelite
      runelite

      ## eww
      eww-wayland

      ## emacs
      emacs
    ];
  };

  ## Custom Configuration Packages
  imports = [
    ./alacritty
    ./bash
    ./bat
    ./direnv
    ./eza
    ./firefox
    ./git
    ./gtk
    ./hyprland
    ./mpd
    ./ncmpcpp
    ./neovim
    ./rofi
    ./texlive
    ./waybar
  ];
}
