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
    ./waybar
    ./rofi
    ./cava
    ./starship
    ./noctalia
  ];
}

