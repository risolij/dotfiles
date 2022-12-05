{ config, pkgs, ... }:

{
  xsession = {
    enable = true;

    windowManager.herbstluftwm = {
      enable = true;
      tags = [ "term" "web" "extr" ];
      settings = {
        gapless_grid = false;
        frame_gap = 10;
        window_border_width = 2;
        window_border_active_color = "#FF0000";
        frame_bg_transparent = 0;
        frame_border_width = 0;
        always_show_frame = 0;
      };

      keybinds = {
        ## Mod key
        Mod = "Mod4";

        ## Close
        Mod4-Shift-c = "quit";
        Mod4-Shift-q = "close_or_remove";

        ## Reload
        Mod4-Shift-r = "reload";

        ## Applications
        Mod4-Return = "spawn alacritty";
        Mod4-d = "spawn rofi -show drun";

        ## Focus
        Mod4-l = "focus right";
        Mod4-h = "focus left";
        Mod4-k = "focus up";
        Mod4-j = "focus down";

        ## Shift
        Mod4-Shift-l = "shift right";
        Mod4-Shift-h = "shift left";
        Mod4-Shift-k = "shift up";
        Mod4-Shift-j = "shift down";

        ## Resize
        Mod4-Control-l = "resize right +0.05";
        Mod4-Control-h = "resize left +0.05";
        Mod4-Control-k = "resize up +0.05";
        Mod4-Control-j = "resize down +0.05";

        ## Split 
        Mod4-Control-p = "split right";
        Mod4-Control-u = "split left";
        Mod4-Control-i = "split top";
        Mod4-Control-o = "split bottom";

        ## Modes
        Mod4-f = "fullscreen toggle";
        Mod4-e = "pseudotile toggle";
        Mod4-c = "cycle_layout 1";
      };
    };
  };
}
