{ config, pkgs, lib, ... }:

{
  services.picom  = {
    enable = true;
    vSync = true;
    inactiveOpacity = 0.9;
    fade = true;
    fadeDelta = 15;
    shadow = true;
    opacityRules = [ "100:class_g *= 'Rofi'"];
  };
}
