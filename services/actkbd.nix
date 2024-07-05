{ pkgs, lib, config, ... }:

with lib;

let
  inherit (pkgs) wireplumber;
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
            command = "${wireplumber}/bin/wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle";
          }
          {
            keys = [ 114 ];
            events = [ "key" "rep" ];
            command = "${wireplumber}/bin/wpctl set-volume @DEFAULT_AUDIO_SINK@ 2%-";
          }
          {
            keys = [ 115 ];
            events = [ "key" "rep" ];
            command = "${wireplumber}/bin/wpctl set-volume @DEFAULT_AUDIO_SINK@ 2%+";
          }
          {
            keys = [ 125 ];
            events = [ "key" ];
            command = "${betterlockscreen}/bin/betterlockscreen --lock";
          }
          {
            keys = [ 190 ];
            events = [ "key" ];
            command = "${wireplumber}/bin/wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle";
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
