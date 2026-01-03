{ inputs, config, pkgs, lib, system, ... }: {

  wayland.windowManager.hyprland = {
    enable = true;
    systemd.enable = true;
    xwayland.enable = true;
    settings = {
      monitor = [
        "DP-2,  2560x1080, 0x0, 1"
        "eDP-1, 1920x1080, 2560x0, 1"
      ];

      general = import ./general.nix;
      master = {
        orientation = "right";
      };

      input = import ./input.nix;
      gestures = {
        workspace_swipe_forever = true;
      };

      misc = {
        disable_hyprland_logo = true;
        mouse_move_enables_dpms = true;
        key_press_enables_dpms = true;
      };

      decoration = {
        rounding = 18;
        inactive_opacity = 1.0;
        dim_special = 0.6;

        blur = {
          xray = true;
          enabled = true;
          passes = 1;
          new_optimizations = true;
          size = 8;
        };
      };

      animations = {
        enabled = true;
        bezier = "myBezier, 0.05, 0.9, 0.1, 1.05";
        animation = [
          "windows, 1, 7, myBezier"
          "windowsOut, 1, 7, default, slidefade 20%"
          "border, 1, 10, default"
          "fade, 1, 7, default"
          "workspaces, 1, 6, default"
        ];
      };

      gesture = [
        "3, horizontal, workspace"
      ];

      workspace = [
        "1, monitor:DP-2,persistent:true"
        "2, monitor:DP-2,persistent:true"
        "3, monitor:DP-2,persistent:true"
        "4, monitor:DP-2,persistent:true"
        "5, monitor:eDP-1,persistent:true"
        "6, monitor:eDP-1,persistent:true"
        "7, monitor:eDP-1,persistent:true"
        "8, monitor:eDP-1,persistent:true"
        "9, monitor:eDP-1,persistent:true"
      ];

      "$mod" = "SUPER";

      bind = [
        "$mod, C, movetoworkspace, special:firefox"
        "$mod, F, exec, [workspace special:firefox silent; float; move 0 0] firefox"
        "$mod, R, togglespecialworkspace, firefox"
        "$mod SHIFT, W, exec, systemctl restart --user waybar"
        "$mod, RETURN, exec, alacritty"
        "$mod SHIFT, P, exec, [fullscreen] /home/req/.config/rofi/powermenu.sh"
        "$mod SHIFT, S, exec, [fullscreen] /home/req/.config/rofi/screenie.sh"
        "$mod SHIFT, Q, killactive"
        "$mod SHIFT, C, exit"
        "$mod, V, togglefloating"
        "$mod, D, exec, [float; size 1000 500; center] rofi -combi-modi window,drun,ssh,filebrowser --show-icons -show drun"
        "$mod, P, pseudo"
        "$mod, S, togglesplit"

        #### Move focus
        "$mod, left, movefocus, l"
        "$mod, right, movefocus, r"
        "$mod, up, movefocus, u"
        "$mod, down, movefocus, d"
        "$mod, j, layoutmsg, cyclenext"
        "$mod, k, layoutmsg, cycleprev"

        #### Resizing
        "$mod CTRL, l, resizeactive, 40 0"
        "$mod CTRL, h, resizeactive, -40 0"
        "$mod CTRL, k, resizeactive, 0 -40"
        "$mod CTRL, j, resizeactive, 0 40"

        #### Switch workspaces
        "$mod, 1, workspace, 1"
        "$mod, 2, workspace, 2"
        "$mod, 3, workspace, 3"
        "$mod, 4, workspace, 4"
        "$mod, 5, workspace, 5"
        "$mod, 6, workspace, 6"
        "$mod, 7, workspace, 7"
        "$mod, 8, workspace, 8"
        "$mod, 9, workspace, 9"

        #### Move active window
        "$mod SHIFT, 1, movetoworkspace, 1"
        "$mod SHIFT, 2, movetoworkspace, 2"
        "$mod SHIFT, 3, movetoworkspace, 3"
        "$mod SHIFT, 4, movetoworkspace, 4"
        "$mod SHIFT, 5, movetoworkspace, 5"
        "$mod SHIFT, 6, movetoworkspace, 6"
        "$mod SHIFT, 7, movetoworkspace, 7"
        "$mod SHIFT, 8, movetoworkspace, 8"
        "$mod SHIFT, 9, movetoworkspace, 9"
        "$mod SHIFT, j, layoutmsg, swapnext"
        "$mod SHIFT, k, layoutmsg, swapprev"
        "$mod, SPACE, layoutmsg, swapwithmaster"

        #### Scroll through existing workspaces
        "$mod, mouse_down, workspace, e+1"
        "$mod, mouse_up, workspace, e-1"
      ];
    };

    ## bindl=, XF86TouchpadOff, exec, hyprctl dispatch dpms toggle
    extraConfig = ''
      bindle=, XF86AudioRaiseVolume, exec, wpctl set-volume -l 1.5 @DEFAULT_AUDIO_SINK@ 5%+
      bindle=, XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-
      bindl=, XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle
      bindl=, XF86AudioMicMute, exec, wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle
      bindle=, XF86MonBrightnessDown, exec, brightnessctl set 5%-
      bindle=, XF86MonBrightnessUp, exec, brightnessctl set 5%+
      bindl=, Print, exec, grim -g "$(slurp)"
      workspace=special:firefox,gapsout:100
    '';
  };
}
