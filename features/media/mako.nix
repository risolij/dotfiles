{ lib, config, pkgs, ... }:

with lib;

{
  options.home-services-mako.enable = mkOption {
    type = types.bool;
    default = false;
    description = "Enable mako";
  };

  config = mkIf config.home-services-mako.enable {
    services.mako = {
      enable = true;
      settings = {
        padding = "10";
        default-timeout = 4000;
        width = 300;
        height = 200;
        border-radius = 10;
      };
    };
  };
}
