{ config, pkgs, ... }:
{
  imports = [
    ./mpd
    ./mako
    ## ./hyprpaper
  ];
}
