{ pkgs, lib, config, ... }:

with lib;

{
  options.nix-services-hardware-bolt.enable = mkOption {
    type = types.bool;
    default = false;
    description = "Enable ThunderboltBolt";
  };

  config = mkIf config.nix-services-hardware-bolt.enable {
    services.hardware.bolt.enable = true;
  };
}
