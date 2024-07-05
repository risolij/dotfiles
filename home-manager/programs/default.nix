{ config, pkgs, ... }:
{
  imports = [
    ./alacritty
    ./bash
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
    ./librewolf
    ./cava
  ];
}

