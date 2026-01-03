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

      animations = {
        enable = true;
        config-notification-open-close.enable = true;
        horizontal-view-movement.enable = true;
      };

      layout = {
        gaps = 10;
        default-column-width = {
          proportion = .5;
        };
      };

      hotkey-overlay = {
        skip-at-startup = true;
        hide-not-bound = true;
      };


      gestures = {
        hot-corners.enable = true;
      };

      prefer-no-csd = true;

      spawn-at-startup = [
        { argv = ["noctalia-shell"]; }
      ];

      binds = {
        "Mod+D".action.spawn = [ "noctalia-shell" "ipc" "call" "launcher" "toggle" ];
        "Mod+Return".action.spawn = "alacritty";

        "Mod+Shift+Q".action.close-window = [];
        "Mod+Shift+E".action.quit = [];
        "Mod+BracketLeft".action.consume-or-expel-window-left = [];
        "Mod+BracketRight".action.consume-or-expel-window-right = [];
        "Mod+H".action.focus-column-left = [];
        "Mod+L".action.focus-column-right = [];
        "Mod+K".action.focus-window-up = [];
        "Mod+J".action.focus-window-down = [];

        "Mod+Shift+H".action.move-column-left = [];
        "Mod+Shift+L".action.move-column-right = [];
        "Mod+Shift+K".action.move-window-up= [];
        "Mod+Shift+J".action.move-window-down = [];

        "Mod+1".action.focus-workspace = 1;
        "Mod+2".action.focus-workspace = 2;
        "Mod+3".action.focus-workspace = 3;
        "Mod+4".action.focus-workspace = 4;
        "Mod+5".action.focus-workspace = 5;
        "Mod+6".action.focus-workspace = 6;
        "Mod+7".action.focus-workspace = 7;
        "Mod+8".action.focus-workspace = 8;

        "Mod+Shift+1".action.move-column-to-workspace = 1;
        "Mod+Shift+2".action.move-column-to-workspace = 2;
        "Mod+Shift+3".action.move-column-to-workspace = 3;
        "Mod+Shift+4".action.move-column-to-workspace = 4;
        "Mod+Shift+5".action.move-column-to-workspace = 5;
        "Mod+Shift+6".action.move-column-to-workspace = 6;
        "Mod+Shift+7".action.move-column-to-workspace = 7;
        "Mod+Shift+8".action.move-column-to-workspace = 8;

        "Mod+R".action.switch-preset-column-width = [];
        "Mod+F".action.maximize-column = [];
        "Mod+Shift+F".action.fullscreen-window = [];
        "Mod+Ctrl+H".action.set-column-width = "-10%";
        "Mod+Ctrl+L".action.set-column-width = "+10%";
      };
    };
  };
}

