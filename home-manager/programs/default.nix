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
    ## ./niri
    ## ./hyprland
    ## ./eww
    ./ncmpcpp
    ./neovim
    ./waybar
    ./rofi
    ./cava
    ./starship
  ];
}

