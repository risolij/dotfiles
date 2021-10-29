{ config, pkgs, lib, ... }:

{
  ## Packages without custom configuration
  home.packages = with pkgs; [
    acpi
    bat
    cpulimit
    dig
    dzen2
    emacs
    emacs-all-the-icons-fonts
    feh
    file
    firefox
    ghc
    google-chrome
    htop
    imagemagick
    inconsolata
    latex
    lsof
    neofetch
    nmap
    papirus-icon-theme
    pavucontrol
    pciutils
    pulsemixer
    ## python3
    scrot
    sqlite
    tcpdump
    tree
    unzip
    weechat
    zip
    zoom-us
    ## jq
    ## openvpn
    ## file
    ## ansible
    ## sshpass
    ## nixops
    ## xlsx2csv
    ## usbutils
  ];
}
