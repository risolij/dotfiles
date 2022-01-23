{ pkgs, lib, config, ... }:

let cfg = config.services.betterlockscreen;
in
{
  services.screen-locker = {
    enable = true;
    lockCmd = "${cfg.package}/bin/betterlockscreen --lock";
  };

}
