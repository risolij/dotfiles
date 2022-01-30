{ pkgs, lib, config, ... }:

with lib;

let
  inherit (pkgs) alsa-utils;
  inherit (pkgs) brightnessctl;
in
{
    services.actkbd = {
        enable = true;
        bindings = [
          {
            keys = [ 113 ];
            events = [ "key" ];
            command = "${alsa-utils}/bin/amixer -c0 -q set Master toggle";
          }
          {
            keys = [ 114 ];
            events = [ "key" "rep" ];
            command = "${alsa-utils}/bin/amixer -c0 -q set Master 2-";
          }
          {
            keys = [ 115 ];
            events = [ "key" "rep" ];
            command = "${alsa-utils}/bin/amixer -c0 -q set Master 2+";
          }
          {
            keys = [ 190 ];
            events = [ "key" ];
            command = "${alsa-utils}/bin/amixer -c0 -q set Mic toggle";
          }
          {
            keys = [ 224 ];
            events = [ "key" ];
            command = "${brightnessctl}/bin/brightnessctl set 2%-";
          }
          {
            keys = [ 225 ];
            events = [ "key" ];
            command = "${brightnessctl}/bin/brightnessctl set 2%+";
          }
        ];
    };
}
