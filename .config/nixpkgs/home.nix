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
    };
    pointerCursor = {
      x11 = {
        enable = true;
        defaultCursor = "left_ptr";
      };

      package = pkgs.vanilla-dmz;
      name = "Vanilla-DMZ";
      size = 32;
    };

    packages = with pkgs; [
      ## Common Tools
      brightnessctl
      file
      unzip
      bc
      appimage-run

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

      ## Networking Tools
      dig
      lsof
      nmap
      tcpdump
      ## insomnia

      ## Security Tools
      vulnix

      ## Development Tools
      emacs
      virt-manager

      ## Image Tools
      feh
      imagemagick
      scrot
      cava

      ## Fonts && Themes
      emacs-all-the-icons-fonts
      font-awesome
      inconsolata
      arc-icon-theme
      ## papirus-icon-theme

      ## Audio Tools
      pavucontrol
      pulsemixer

      ############### node
      nodejs
      dconf

      ############### java
      ## jdk11
      ## graphviz
      ## plantuml

      ############### extras
      ## google-chrome
      ## libreoffice
      ## weechat
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
    ./broot/broot.nix
    ./direnv/direnv.nix
    ./exa/exa.nix
    ./firefox/firefox.nix
    ./git/git.nix
    ./gtk/gtk.nix
    ./mpd/mpd.nix
    ./ncmpcpp/ncmpcpp.nix
    ./neovim/neovim.nix
    ./notify-osd/notify-osd.nix
    ./picom/picom.nix
    ./qutebrowser/qutebrowser.nix
    ./rofi/rofi.nix
    ./xmonad/xmobar.nix
    ./xmonad/xmonad.nix
    ./betterlockscreen/betterlockscreen.nix
    ## ./herbstluftwm/herbstluftwm.nix
    ## ./texlive/texlive.nix
  ];
}
