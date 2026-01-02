{ config, lib, pkgs, inputs, ... }:
{
  imports = [
    inputs.niri.homeModules.config 
  ];

  programs.niri = {
    enable = true;
    settings = {
      focus-follows-mouse.enable = true;
      input = {
        mod-key = "Super";

        mouse = {
          accel-profile = "flat";
          accel-speed = 2.0;
        };
      };

      binds = {
        "Mod+D".action.spawn = "rofi -show drun";
        "Mod+Enter".action.spawn = "alacritty";
      };
    };
  };
}

