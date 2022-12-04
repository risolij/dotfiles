{ config, pkgs, lib, ... }:

{
  services.picom  = {
    enable = true;
    inactiveOpacity = 0.9;
    fade = true;
    fadeDelta = 15;
    shadow = true;
    ## blur = true;
    opacityRules = [ "100:class_g *= 'Rofi'"];
  };
}
