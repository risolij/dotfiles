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
    ./cava
    ./starship
    ./noctalia
    ./discord
    ./stylix
    ## ./gtk
    ## ./rofi
    ## ./qt
  ];
}

