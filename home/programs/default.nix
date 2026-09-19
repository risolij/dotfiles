{ pkgs, ... }:
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
    ./cava
    ./starship
    ./noctalia
    ./discord
    ./stylix
    ./nixvim
  ];
}
