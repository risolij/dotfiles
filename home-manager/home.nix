{ config, pkgs, lib, ... }:

{
  ## Enable Home Manager
  programs.home-manager.enable = true;

  ## Enable manual manpages
  manual.manpages.enable = true;

  home = {
    stateVersion = "21.05";
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
      x11 = {
        enable = true;
        defaultCursor = "left_ptr";
      };

      gtk.enable = true;
      package = pkgs.vanilla-dmz;
      name = "Vanilla-DMZ";
      size = 48;
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
      cava
      hyprpaper

      ## Fonts && Themes
      font-awesome
      inconsolata

      ## Audio Tools
      pavucontrol
      pulsemixer
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
    ./exa/exa.nix
    ./firefox/firefox.nix
    ./git/git.nix
    ./gtk/gtk.nix
    ./mpd/mpd.nix
    ./ncmpcpp/ncmpcpp.nix
    ./neovim/neovim.nix
    ./notify-osd/notify-osd.nix
    ./rofi/rofi.nix
    ./waybar/waybar.nix
    ## ./betterlockscreen/betterlockscreen.nix
  ];
}
