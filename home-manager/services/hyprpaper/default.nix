{ config, pkgs, ... }:

{
  services.hyprpaper = {
    enable = true;
    wallpapers = [
      "eDP-1,~/Pictures/wallpapers/wolf.png"
      "DP-2,~/Pictures/wallpapers/wolf.png"
    ];
}

