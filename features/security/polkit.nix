{ config, lib, pkgs, ... }:

with lib;

{
  options.nix-polkit.enable = mkOption {
    type = types.bool;
    default = false;
    description = "Enable polkit";
  };

  config = mkIf config.nix-polkit.enable {
    security.polkit.enable = true;
  };
}

