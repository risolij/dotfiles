{ pkgs, lib, config, ... }:

with lib;

{
  options.nix-services-speechd.enable = mkOption {
    type = types.bool;
    default = false;
    description = "Enable Speechd";
  };

  config = mkIf config.nix-services-speechd.enable {
    services.speechd = {
      enable = true;
      package = pkgs.espeak-ng;
    };
  };
}
