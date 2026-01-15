{ config, lib, pkgs, ... }:

with lib;

{
  options.nix-rtkit.enable = mkOption {
    type = types.bool;
    default = false;
    description = "Enable rtkit";
  };

  config = mkIf config.nix-rtkit.enable {
    security.rtkit.enable = true;
  };
}

