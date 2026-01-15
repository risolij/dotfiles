{ pkgs, lib, config, ... }:

with lib;

{
  options.nix-services-logind.enable = mkOption {
    type = types.bool;
    default = false;
    description = "Enable SSH";
  };

  config = mkIf config.nix-services-logind.enable {
    services.logind.settings.Login.HandleLidSwitch = "suspend";
  };
}
