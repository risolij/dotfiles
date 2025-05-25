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
    ./hyprland
    ./ncmpcpp
    ./neovim
    ./waybar
    ./rofi
    ./eww
    ./cava
    ./starship
    ## ./eza
    ##./bash
    ## ./librewolf
  ];
}

