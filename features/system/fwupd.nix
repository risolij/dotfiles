{ pkgs, lib, config, ... }:

with lib;

{
  options.nix-services-fwupd.enable = mkOption {
    type = types.bool;
    default = false;
    description = "fwupd Firmware updater enabled";
  };

  config = mkIf config.nix-services-fwupd.enable {
    services.fwupd.enable = true;
  };
}
