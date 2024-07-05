{ config, pkgs, ... }:

{
  programs.cava = {
    enable = true;
    settings = {
      general.framerate = 60;
      smoothing.noise_reduction = 88;
      color = {
        foreground = "'#FF0000'";
      };
    };
  };
}
