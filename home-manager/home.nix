{ config, pkgs, lib, ... }:

{
  ## Enable Home Manager
  programs.home-manager.enable = true;

  ## Enable manual manpages
  manual.manpages.enable = true;

  ## enable fontconfig
  fonts.fontconfig.enable = true;

  home = {
    ##stateVersion = "21.05";
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
      ## Common Tools
      brightnessctl
      file
      unzip
      bc
      appimage-run
      dconf
      nodejs

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


      ## Temp tools
      ## libreoffice-fresh
      ## texlive.combined.scheme-full

      ## runelite
      runelite
    ];
  };


  ## Allow unfree packages && nix community packages
  nixpkgs.config = {
    allowUnfree = true;
    packageOverrides = pkgs: {
      nur = import (builtins.fetchTarball "https://github.com/nix-community/NUR/archive/master.tar.gz") {
        inherit pkgs;
      };
    };
  };

  ## Custom Configuration Packages
  imports = [
    ./alacritty/alacritty.nix
    ./bash/bash.nix
    ./bat/bat.nix
    ./direnv/direnv.nix
    ./eza/eza.nix
    ./firefox/firefox.nix
    ./git/git.nix
    ./gtk/gtk.nix
    ./mpd/mpd.nix
    ./ncmpcpp/ncmpcpp.nix
    ./neovim/neovim.nix
    ./notify-osd/notify-osd.nix
    ./rofi/rofi.nix
    ./waybar/waybar.nix
    ./hyprland/hypr.nix
    ./eww/eww.nix
    ## ./betterlockscreen/betterlockscreen.nix
  ];
}
