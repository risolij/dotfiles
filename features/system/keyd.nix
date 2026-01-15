{ pkgs, lib, config, ... }:

with lib;

{
  options.nix-services-keyd.enable = mkOption {
    type = types.bool;
    default = false;
    description = "Enable KeyD for remapping keys";
  };

  config = mkIf config.nix-services-keyd.enable {
    services.keyd = {
      enable = true;

      keyboards.default = {
        settings = {
          main = {
            "leftmeta+l" = "coffee";
          };
        };
      };
    };
  };
}
