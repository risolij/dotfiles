{ pkgs, lib, config, ... }:

{
  services.betterlockscreen = {
    enable = true;
    inactiveInterval = 20;
  };
}
