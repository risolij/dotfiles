{ config, lib, pkgs, ... }:
{
  networking.networkmanager.enable = true;
  ## systemd.services.NetworkManager-wait-online.enable = false;
  services.nscd.enable = false;
  system.nssModules = lib.mkForce [ ];
}
