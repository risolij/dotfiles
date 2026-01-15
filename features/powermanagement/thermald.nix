{ pkgs, lib, config, ... }:

with lib;

{
  options.nix-services-thermald.enable = mkOption {
    type = types.bool;
    default = false;
    description = "Enable thermald";
  };

  config = mkIf config.nix-services-thermald.enable {
    services.thermald.enable = true;
  };
}
