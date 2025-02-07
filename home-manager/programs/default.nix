{ config, pkgs, ... }:
{
  imports = [
    ./alacritty
    ./nushell
    ./bat
    ./direnv
    ./eza
    ./firefox
    ./git
    ./gtk
    ./hyprland
    ./ncmpcpp
    ./neovim
    ./waybar
    ./rofi
    ./eww
    ./cava
    ./starship
    ##./bash
    ## ./librewolf
  ];
}

