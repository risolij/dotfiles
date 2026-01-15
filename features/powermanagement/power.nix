{ pkgs, lib, config, ... }:

with lib;

{
  options = {
    nix-services-upower.enable = mkOption {
      type = types.bool;
      default = false;
      description = "Enable upower";
    };

    nix-services-power-profiles-daemon.enable = mkOption {
      type = types.bool;
      default = false;
      description = "Enable power-profiles-daemon";
    };
  };

  config = lib.mkMerge [
    (mkIf config.nix-services-upower.enable {
      services.upower.enable = true;
    })

    (mkIf config.nix-services-power-profiles-daemon.enable {
      services.power-profiles-daemon.enable = false;
    })
  ];
}
