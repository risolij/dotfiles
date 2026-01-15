{ config, lib, pkgs, ... }:

with lib;

{
  options.nix-xdg.enable = mkOption {
    type = types.bool;
    default = false;
    description = "Enable XDG portals";
  };

  config = mkIf config.nix-xdg.enable {
    xdg = {
      icons.enable = true;
      portal = {
        enable = true; 
        config = {
          common = {
            default = [ "gtk" ];
          };
        };
        extraPortals = [ 
          pkgs.xdg-desktop-portal
          pkgs.xdg-desktop-portal-gtk 
        ];
      };
    };
  };
}
