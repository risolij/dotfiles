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
    acpi
    brightnessctl
    cpulimit
    dig
    dmidecode
    dzen2
    emacs
    emacs-all-the-icons-fonts
    fd
    feh
    file
    google-chrome
    ghc
    imagemagick
    inconsolata
    font-awesome
    inxi
    jq
    killall
    libnotify
    lsof
    nmap
    nmon
    nodejs
    papirus-icon-theme
    parted
    pavucontrol
    pciutils
    pulsemixer
    python3
    ripgrep
    scrot
    tcpdump
    unzip
    usbutils
    weechat
    zip
  ];

  ## Custom Configuration Packages
  imports = [
    ./packages/alacritty/alacritty.nix 
    ./packages/bash/bash.nix
    ./packages/bat/bat.nix
    # Don't use until bug is fixed "https://github.com/NixOS/nixpkgs/issues/157112"
    # ./packages/betterlockscreen/betterlockscreen.nix
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
    # ./packages/qutebrowser/qutebrowser.nix
    ./packages/rofi/rofi.nix
    ./packages/xmonad/xmobar.nix
    ./packages/xmonad/xmonad.nix
  ];
}
