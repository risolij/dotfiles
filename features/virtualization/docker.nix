{ config, lib, pkgs, ... }:

with lib;

{
  options.nix-docker.enable = mkOption {
    type = types.bool;
    default = false;
    description = "Enable docker";
  };

  config = mkIf config.nix-docker.enable {
    virtualisation.docker = {
      enable = true;
      storageDriver = "btrfs"
      rootless = {
        enable = true;
        setSocketVariable = true;
      };
    };
  };
}
