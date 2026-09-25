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
        services.nscd.enable = false;
        system.nssModules = lib.mkForce [ ];
    };
}
