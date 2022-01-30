{ pkgs, lib, config, ... }:

## let cfg = config.services.betterlockscreen;
## in
{
  services.betterlockscreen = {
    enable = true;
    inactiveInterval = 20;
  };
  ##services.screen-locker = {
  ##  enable = true;
  ##  inactiveInterval = 20;
  ##  lockCmd = "${cfg.package}/bin/betterlockscreen --lock";
  ##};

}
