{ pkgs, lib, config, ... }:

with lib;

{
  options.nix-services-flatpak.enable = mkOption {
    type = types.bool;
    default = false;
    description = "Enable flatpaks";
  };

  config = mkIf config.nix-services-flatpak.enable {
    services.flatpak.enable = true;
  };
}
