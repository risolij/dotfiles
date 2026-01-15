{ config, lib, pkgs, ... }:

with lib;

{
  options.nix-networking.enable = mkOption {
    type = types.bool;
    default = false;
    description = "Enable networking items";
  };

  config = mkIf config.nix-networking.enable {
    networking.networkmanager.enable = true;
    ## systemd.services.NetworkManager-wait-online.enable = false;
    services.nscd.enable = false;
    system.nssModules = lib.mkForce [ ];
  };
}
