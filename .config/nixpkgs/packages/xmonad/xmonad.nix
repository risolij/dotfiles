{ config, pkgs, ... }:

let 
   cfg = config.xsession.pointerCursor;
in
{
  xsession = {
    enable = true;

    windowManager.xmonad = {
      enable = true;
      enableContribAndExtras = true;
      extraPackages = hp: [
        hp.xmonad-contrib
        hp.xmobar
      ];
      config = ./config.hs;
    };

    initExtra = ''
      ${pkgs.xorg.xsetroot}/bin/xsetroot -xcf ${cfg.package}/share/icons/${cfg.name}/cursors/${cfg.defaultCursor} ${
        toString cfg.size
      }
    '';
  };
}
