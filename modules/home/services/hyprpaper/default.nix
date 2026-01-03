{ config, pkgs, ... }:

{
  services.hyprpaper = {
    enable = true;
    settings = {
      preload = [
        "/home/req/Pictures/wallpapers/wolf.png"
        "/home/req/Pictures/wallpapers/spaceman.png"
        "/home/req/Pictures/wallpapers/tokyo-night.jpg"
        "/home/req/Pictures/wallpapers/ramen.jpg"
        "/home/req/Pictures/wallpapers/ramen2.jpg"
        "/home/req/Pictures/wallpapers/resized.jpg"
      ];
      wallpaper = [
        "eDP-1,/home/req/Pictures/wallpapers/ramen2.jpg"
        "DP-2,/home/req/Pictures/wallpapers/resized.jpg"
        "DP-3,/home/req/Pictures/wallpapers/resized.jpg"
      ];
    };
  };
}

