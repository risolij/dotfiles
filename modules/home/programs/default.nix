{ config, pkgs, ... }:
{
  imports = [
    ./alacritty
    ./nushell
    ./bat
    ./direnv
    ./firefox
    ./git
    ./gtk
    ./niri
    ./ncmpcpp
    ./neovim
    ./rofi
    ./cava
    ./starship
    ./noctalia
    ./discord
    ./virt-manager
  ];
}

