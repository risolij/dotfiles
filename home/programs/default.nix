{ pkgs, ... }:
{
    imports = [
        ./alacritty
        ./bat
        ./direnv
        ./discord
        ./firefox
        ./git
        ./mpv
        ./ncmpcpp
        ./niri
        ./nixvim
        ./noctalia
        ./nushell
        ./starship
        ./stylix
        ./system-packages.nix
    ];
}
