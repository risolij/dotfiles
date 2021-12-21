{ pkgs, lib, config, ... }:

{
    services.actkbd = {
        enable = true;
        bindings = [
          { keys = [ 114 ]; events = [ "key" ]; command = "pactl -- set-sink-volume 3 -10%"; }
          { keys = [ 115 ]; events = [ "key" ]; command = "pactl -- set-sink-volume 3 +10%"; }
        ];
    };
}
