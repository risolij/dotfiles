{ config, pkgs, lib, ... }:

{
  services.picom  = {
    enable = true;
    inactiveOpacity = "0.9";
    fade = true;
    shadow = true;
    blur = true;
    opacityRule = [ "100:class_g *= 'Rofi'"];
  };
}
