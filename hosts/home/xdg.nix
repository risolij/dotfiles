{ config, lib, pkgs, ... }:

{
  xdg.portal = { 
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
}
