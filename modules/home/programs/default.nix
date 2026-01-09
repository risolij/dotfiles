{ config, pkgs, ... }:
{
  imports = [
    ./alacritty
    ./nushell
    ./bat
    ./direnv
    ./firefox
    ./git
    ./niri
    ./ncmpcpp
    ./neovim
    ./rofi
    ./cava
    ./starship
    ./noctalia
    ./discord
    ## ./gtk
    ## ./qt
  ];
}

