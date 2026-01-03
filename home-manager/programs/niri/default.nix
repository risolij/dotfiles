{ config, lib, pkgs, inputs, ... }:
{
  programs.niri = {
    enable = true;
    settings = {
      input = {
        mod-key = "Super";

        mouse = {
          accel-profile = "flat";
          accel-speed = 1;
        };
      };

      gestures = {
        hot-corners.enable = true;
      };

      prefer-no-csd = true;

      spawn-at-startup = [
        { argv = ["swaybg" "--image" "/home/req/Pictures/wallpapers/resized.png"]; }
      ];

      binds = {
        "Mod+D".action.spawn = ["rofi" "-show" "drun"];
        "Mod+Return".action.spawn = "alacritty";

        "Mod+Shift+Q".action.close-window = [];
        "Mod+H".action.focus-column-left = [];
        "Mod+L".action.focus-column-right = [];
        "Mod+K".action.focus-window-up = [];
        "Mod+J".action.focus-window-down = [];

        "Mod+Shift+H".action.move-column-left = [];
        "Mod+Shift+L".action.move-column-right = [];
        "Mod+Shift+K".action.move-window-up = [];
        "Mod+Shift+J".action.move-window-down = [];

        "Mod+1".action.focus-workspace = "1";
        "Mod+2".action.focus-workspace = "2";
        "Mod+3".action.focus-workspace = "3";
        "Mod+4".action.focus-workspace = "4";
        "Mod+5".action.focus-workspace = "5";
        "Mod+6".action.focus-workspace = "6";
        "Mod+7".action.focus-workspace = "7";
        "Mod+8".action.focus-workspace = "8";

        "Mod+R".action.switch-preset-column-width = [];
        "Mod+F".action.maximize-column = [];
        "Mod+Shift+F".action.fullscreen-window = [];
      };
    };
  };
}

