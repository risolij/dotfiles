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
    ## ./hyprland
    ##./eww
    ./ncmpcpp
    ./neovim
    ./waybar
    ./rofi
    ./cava
    ./starship
  ];
}

