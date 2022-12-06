{ config, lib, pkgs, ... }:

{
  system = {
    stateVersion = "20.09";
    autoUpgrade.enable = true;
    autoUpgrade.allowReboot = true;
  };
}

