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
    filezilla
    firefox
    ghc
    google-chrome
    htop
    imagemagick
    inconsolata
    lsof
    neofetch
    nmap
    papirus-icon-theme
    pavucontrol
    pciutils
    pulsemixer
    scrot
    sqlite
    tcpdump
    tree
    unzip
    weechat
    zip
    zoom-us
    ## python3
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
