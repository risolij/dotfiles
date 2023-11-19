{ config, pkgs, ... }:

{
  services.mpd = {
    enable = true;
    musicDirectory = ~/music;
  };
}
