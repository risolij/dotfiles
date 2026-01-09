{ config, lib, pkgs, ... }:

{
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
}
