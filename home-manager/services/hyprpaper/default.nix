{ config, pkgs, ... }:

{
  services.hyprpaper = {
    enable = true;
    settings = {
      preload = [
        "/home/req/Pictures/wallpapers/wolf.png"
      ];
      wallpaper = [
        "eDP-1,/home/req/Pictures/wallpapers/wolf.png"
        "DP-2,/home/req/Pictures/wallpapers/wolf.png"
      ];
    };
  };
}

