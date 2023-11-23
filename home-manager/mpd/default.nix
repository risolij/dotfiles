{ config, pkgs, ... }:

{
  services.mpd = {
    enable = true;
    musicDirectory = /home/req/music;
  };
}
