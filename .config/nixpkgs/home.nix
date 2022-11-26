{ config, pkgs, lib, ... }:

{
  ## Enable Home Manager
  programs.home-manager.enable = true;


  ## Enable manual manpages
  ## Disable until bugfix --> https://github.com/NixOS/nixpkgs/issues/196651
  manual.manpages.enable = false;

  home = {
    stateVersion = "21.05";
    username = "req";
    homeDirectory = "/home/req";
    sessionVariables = {
      EDITOR = "nvim";
      TERMINAL = "alacritty";
      BROWSER = "firefox";
      ANSIBLE_CONFIG = "/home/req/dev/ansible/ansible.cfg";
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
      appimage-run

      ## Hardware Tools
      acpi
      dmidecode
      inxi
      parted
      pciutils
      usbutils
      lm_sensors

      ## Notification Tools
      dzen2
      libnotify

      ## Networking Tools
      dig
      lsof
      nmap
      tcpdump
      ## insomnia
      ## postman

      ## Development Tools
      emacs
      ## ghc

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
      ## papirus-icon-theme
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
    ./packages/alacritty/alacritty.nix 
    ./packages/bash/bash.nix
    ./packages/bat/bat.nix
    ./packages/broot/broot.nix
    ./packages/direnv/direnv.nix
    ./packages/exa/exa.nix
    ./packages/firefox/firefox.nix
    ./packages/git/git.nix
    ./packages/gtk/gtk.nix
    ./packages/mpd/mpd.nix
    ./packages/ncmpcpp/ncmpcpp.nix
    ./packages/neovim/neovim.nix
    ./packages/notify-osd/notify-osd.nix
    ./packages/picom/picom.nix
    ./packages/qutebrowser/qutebrowser.nix
    ./packages/rofi/rofi.nix
    ./packages/xmonad/xmobar.nix
    ./packages/xmonad/xmonad.nix
    ./packages/betterlockscreen/betterlockscreen.nix
    ## ./packages/herbstluftwm/herbstluftwm.nix
    ## ./packages/texlive/texlive.nix
  ];
}
