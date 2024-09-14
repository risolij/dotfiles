{ config, pkgs, ... }:

{
  services.hyprpaper = {
    enable = true;
    settings = {
      preload = [
        "/home/req/Pictures/wallpapers/wolf.png"
        "/home/req/Pictures/wallpapers/spaceman.png"
      ];
      wallpaper = [
        "eDP-1,/home/req/Pictures/wallpapers/spaceman.png"
        "DP-2,/home/req/Pictures/wallpapers/spaceman.png"
        "DP-3,/home/req/Pictures/wallpapers/spaceman.png"
      ];
    };
  };
}

