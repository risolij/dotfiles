{ config, pkgs, lib, ... }:

{
  ## Enable Home Manager
  programs.home-manager.enable = true;


  ## Enable manual manpages
  manual.manpages.enable = true;


  ## Session Variables
  home.sessionVariables = {
    EDITOR = "nvim";
    TERMINAL = "alacritty";
    BROWSER = "firefox";
    ANSIBLE_CONFIG = "/home/req/dev/ansible/ansible.cfg";
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


  ## Packages without custom configuration
  home.packages = with pkgs; [
    ## Common Tools
    brightnessctl
    file
    jq
    killall
    unzip
    weechat
    zip

    ## Hardware Tools
    acpi
    dmidecode
    inxi
    parted
    pciutils
    usbutils

    ## Notification Tools
    dzen2
    libnotify

    ## Networking Tools
    dig
    lsof
    nmap
    tcpdump

    ## Development Tools
    emacs
    ghc
    nodejs
    python3

    ## Image Tools
    feh
    imagemagick
    scrot

    ## Fonts && Themes
    emacs-all-the-icons-fonts
    font-awesome
    inconsolata
    papirus-icon-theme
    libreoffice

    ## Audio Tools
    pavucontrol
    pulsemixer

    ## browser
    google-chrome
  ];


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
    ./packages/nushell/nushell.nix
    ./packages/picom/picom.nix
    ./packages/rofi/rofi.nix
    ./packages/texlive/texlive.nix
    ./packages/xmonad/xmobar.nix
    ./packages/xmonad/xmonad.nix

    ## Require some fix
      # Don't use until bug is fixed "https://github.com/NixOS/nixpkgs/issues/157112"
      # ./packages/betterlockscreen/betterlockscreen.nix
      # ./packages/qutebrowser/qutebrowser.nix
  ];
}
