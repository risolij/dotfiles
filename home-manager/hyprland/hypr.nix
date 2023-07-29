{ config, lib, pkgs, ... }:

{
  home.file."${config.xdg.configHome}/hypr/hyprland.conf".text = ''
    ## Monitor
    monitor=,preferred,auto,1
    
    
    # Execute your favorite apps at launch
    exec-once = waybar
    exec-once = hyprpaper
    
    
    ## Inputs
    input {
        kb_layout = us
        kb_variant =
        kb_model =
        kb_options =
        kb_rules =
    
        follow_mouse = 1
    
        touchpad {
            natural_scroll = true
            clickfinger_behavior = true
        }
    
        sensitivity = -0.2
    }
    
    
    ## General
    general {
        gaps_in = 10
        gaps_out = 20
        border_size = 5
        col.active_border = rgba(33ccffee)
        col.inactive_border = rgba(595959aa)
        layout = master
    }
    
    
    ## Decorations
    decoration {
        rounding = 5
        inactive_opacity = 1.0
        blur = true
        blur_size = 40
        blur_passes = 1
        blur_new_optimizations = true
    
        drop_shadow = true
        shadow_range = 4
        shadow_render_power = 3
        col.shadow = rgba(1a1a1aee)
        dim_inactive = false
        dim_strength = .1
    }
    
    
    ## Animations
    animations {
        enabled = true
        bezier = myBezier, 0.05, 0.9, 0.1, 1.05
        animation = windows, 1, 7, myBezier
        animation = windowsOut, 1, 7, default, popin 80%
        animation = border, 1, 10, default
        animation = fade, 1, 7, default
        animation = workspaces, 1, 6, default
    }
    
    
    ## Layouts
    dwindle {
        pseudotile = yes
        preserve_split = yes
    }
    
    
    master {
        new_is_master = true
    }
    
    
    ## Gestures
    gestures {
        workspace_swipe = on
        workspace_swipe_fingers = 3
        workspace_swipe_create_new = true
    }
    
    
    ## Misc
    misc {
        disable_hyprland_logo = true
        animate_manual_resizes = true
    }
    
    
    ## Mouse
    device:epic mouse V1 {
        sensitivity = -0.5
    }
    
    
    ## Window Rules
    windowrule=float,Rofi
    
    
    ## Binds
    $mainMod = SUPER
    
    bind = $mainMod, RETURN, exec, alacritty
    bind = $mainMod SHIFT, Q, killactive,
    bind = $mainMod SHIFT, C, exit,
    bind = $mainMod, V, togglefloating,
    bind = $mainMod, D, exec, rofi -combi-modi window,drun,ssh,filebrowser --show-icons -show drun
    bind = $mainMod, P, pseudo,
    bind = $mainMod, S, togglesplit,
    
    #### Move focus
    bind = $mainMod, left, movefocus, l
    bind = $mainMod, right, movefocus, r
    bind = $mainMod, up, movefocus, u
    bind = $mainMod, down, movefocus, d
    bind = $mainMod, j, layoutmsg, cyclenext
    bind = $mainMod, k, layoutmsg, cycleprev
    
    #### Resizing
    bind = $mainMod CTRL, l, resizeactive, 40 0
    bind = $mainMod CTRL, h, resizeactive, -40 0
    bind = $mainMod CTRL, k, resizeactive, 0 -40
    bind = $mainMod CTRL, j, resizeactive, 0 40
    
    bindm = $mainMod, mouse:272, movewindow
    bindm = $mainMod, mouse:273, resizewindow
    
    #### Switch workspaces
    bind = $mainMod, 1, workspace, 1
    bind = $mainMod, 2, workspace, 2
    bind = $mainMod, 3, workspace, 3
    bind = $mainMod, 4, workspace, 4
    bind = $mainMod, 5, workspace, 5
    bind = $mainMod, 6, workspace, 6
    bind = $mainMod, 7, workspace, 7
    bind = $mainMod, 8, workspace, 8
    bind = $mainMod, 9, workspace, 9
    bind = $mainMod, 0, workspace, 10
    
    #### Move active window
    bind = $mainMod SHIFT, 1, movetoworkspace, 1
    bind = $mainMod SHIFT, 2, movetoworkspace, 2
    bind = $mainMod SHIFT, 3, movetoworkspace, 3
    bind = $mainMod SHIFT, 4, movetoworkspace, 4
    bind = $mainMod SHIFT, 5, movetoworkspace, 5
    bind = $mainMod SHIFT, 6, movetoworkspace, 6
    bind = $mainMod SHIFT, 7, movetoworkspace, 7
    bind = $mainMod SHIFT, 8, movetoworkspace, 8
    bind = $mainMod SHIFT, 9, movetoworkspace, 9
    bind = $mainMod SHIFT, 0, movetoworkspace, 10
    bind = $mainMod SHIFT, j, layoutmsg, swapnext
    bind = $mainMod SHIFT, k, layoutmsg, swapprev
    bind = $mainMod, SPACE, layoutmsg, swapwithmaster
    
    #### Scroll through existing workspaces
    bind = $mainMod, mouse_down, workspace, e+1
    bind = $mainMod, mouse_up, workspace, e-1
  '';

  home.file."${config.xdg.configHome}/hypr/hyprpaper.conf".text = ''
    preload = /home/req/Pictures/wallpapers/wolf.png

    wallpaper = eDP-1,/home/req/Pictures/wallpapers/wolf.png
  '';
}
