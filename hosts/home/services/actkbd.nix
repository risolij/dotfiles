{ pkgs, lib, config, ... }:

with lib;

let
  inherit (pkgs) alsa-utils;
  inherit (pkgs) brightnessctl;
  inherit (pkgs) betterlockscreen;
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
            keys = [ 125 ];
            events = [ "key" ];
            command = "${betterlockscreen}/bin/betterlockscreen --lock";
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
