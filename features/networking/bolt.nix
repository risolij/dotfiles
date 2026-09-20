{ pkgs, lib, config, ... }:

with lib;

{
  options.nix-services-thunderbolt.enable = mkOption {
    type = types.bool;
    default = false;
    description = "Enable ThunderboltBolt";
  };

  config = mkIf config.nix-services-thunderbolt.enable {
    services.thunderbolt.enable = true;
  };
}
