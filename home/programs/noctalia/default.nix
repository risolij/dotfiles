{ pkgs, lib, ... }:
{
  programs.noctalia = {
    enable = true;
    settings = {
      settings_version = 0;

      bar = {
        default = {
          position = "top";
          density = "spacious";
          show_outline = false;
          show_capsule = false;
          use_separate_opacity = false;
          framed = false;
          margin_ends = 0.0;
          margin_sides = 0.0;
          reserve_space = true;
          radius = 0;
          scale = 1.2;
          font_scale = 1.1;
          thickness = 46;
	  widgets = {
            left = [
              {
                icon = "rocket";
                id = "CustomButton";
                # FIXED: Updated launcher payload string to native v5 format
                leftClickExec = "noctalia msg panel-toggle launcher";
              }
              {
                id = "Clock";
                usePrimaryColor = false;
              }
              {
                id = "SystemMonitor";
              }
              {
                id = "ActiveWindow";
              }
              {
                id = "MediaMini";
              }
            ];
            center = [
              {
                id = "Workspace";
              }
            ];
            right = [
              { id = "ScreenRecorder"; }
              { id = "Tray"; }
              { id = "NotificationHistory"; }
              { id = "Battery"; }
              { id = "Volume"; }
              { id = "Brightness"; }
              { id = "ControlCenter"; }
            ];
          };
        };

        monitors = [ ];

      };

      general = {
        avatar_image = "/home/req/Pictures/Wallpapers/spaceman.png";
        show_screen_corners = false;
        force_black_screen_corners = false;
        scale_ratio = 1;
        radius_ratio = 0.5;
        i_radius_ratio = 0.5;
        box_radius_ratio = 0.5;
        screen_radius_ratio = 1;
        animation_speed = 1;
        animation_disabled = false;
        compact_lock_screen = false;
        lock_on_suspend = true;
        show_session_buttons_on_lock_screen = true;
        show_hibernate_on_lock_screen = false;
        enable_shadows = true;
        shadow_direction = "bottom_right";
        shadow_offset_x = 2;
        shadow_offset_y = 3;
        language = "";
        allow_panels_on_screen_without_bar = true;
      };

      ui = {
        font_default_scale = 1;
        font_fixed_scale = 1;
        tooltips_enabled = true;
        panels_attached_bar = false;
        settings_panel_mode = "centered";
        box_border_enabled = false;
      };

      location = {
        auto_locate = false;
        address = "Tokyo, Japan";
      };

      weather = {
        enabled = true;
        unit = "metric";
      };

      calendar = {
        cards = [
          { enabled = true; id = "calendar-header-card"; }
          { enabled = true; id = "calendar-month-card"; }
          { enabled = true; id = "timer-card"; }
          { enabled = true; id = "weather-card"; }
        ];
      };

      screen_recorder = {
        directory = "";
        frame_rate = 60;
        audio_codec = "opus";
        video_codec = "h264";
        quality = "very_high";
        color_range = "limited";
        show_cursor = true;
        copy_to_clipboard = false;
        audio_source = "default_output";
        video_source = "portal";
      };

      wallpaper = {
        enabled = true;
        overview_enabled = false;
	default = {
	  path = "/home/req/Pictures/Wallpapers/space.jpg";
	};
        directory = "/home/req/Pictures/Wallpapers/";
        monitor_directories = [ ];
        enable_multi_monitor_directories = false;
        recursive_search = false;
        set_wallpaper_on_all_monitors = true;
        fill_mode = "crop";
        fill_color = "#000000";
        use_solid_color = false;
        solid_color = "#1a1a2e";
        random_enabled = false;
        wallpaper_change_mode = "random";
        random_interval_sec = 300;
        transition_duration = 1500;
        transition_type = "random";
        transition_edge_smoothness = 0.05;
        panel_position = "follow_bar";
        hide_wallpaper_filenames = false;
        use_wallhaven = false;
        wallhaven_query = "";
        wallhaven_sorting = "relevance";
        wallhaven_order = "desc";
        wallhaven_categories = "111";
        wallhaven_purity = "100";
        wallhaven_ratios = "";
        wallhaven_api_key = "";
        wallhaven_resolution_mode = "atleast";
        wallhaven_resolution_width = "";
        wallhaven_resolution_height = "";
      };

      app_launcher = {
        enable_clipboard_history = false;
        enable_clip_preview = true;
        position = "center";
        pinned_execs = [ ];
        use_app2unit = false;
        sort_by_most_used = true;
        terminal_command = "alacritty -e";
        custom_launch_prefix_enabled = false;
        custom_launch_prefix = "";
        view_mode = "list";
        show_categories = true;
        icon_mode = "tabler";
        ignore_mouse_input = false;
      };

      control_center = {
        position = "close_to_bar_button";
        disk_path = "/";
        shortcuts = {
          left = [
            { id = "WiFi"; }
            { id = "Bluetooth"; }
            { id = "ScreenRecorder"; }
            { id = "WallpaperSelector"; }
          ];
          right = [
            { id = "Notifications"; }
            { id = "PowerProfile"; }
            { id = "KeepAwake"; }
            { id = "NightLight"; }
          ];
        };
        cards = [
          { enabled = true; id = "profile-card"; }
          { enabled = true; id = "shortcuts-card"; }
          { enabled = true; id = "audio-card"; }
          { enabled = false; id = "brightness-card"; }
          { enabled = true; id = "weather-card"; }
          { enabled = true; id = "media-sysmon-card"; }
        ];
      };

      system_monitor = {
        cpu_warning_threshold = 80;
        cpu_critical_threshold = 90;
        temp_warning_threshold = 80;
        temp_critical_threshold = 90;
        gpu_warning_threshold = 80;
        gpu_critical_threshold = 90;
        mem_warning_threshold = 80;
        mem_critical_threshold = 90;
        disk_warning_threshold = 80;
        disk_critical_threshold = 90;
        cpu_polling_interval = 3000;
        temp_polling_interval = 3000;
        gpu_polling_interval = 3000;
        enable_dgpu_monitoring = false;
        mem_polling_interval = 3000;
        disk_polling_interval = 3000;
        network_polling_interval = 3000;
        load_avg_polling_interval = 3000;
        use_custom_colors = false;
        warning_color = "";
        critical_color = "";
        external_monitor = "resources || missioncenter || jdsystemmonitor || corestats || system-monitoring-center || gnome-system-monitor || plasma-systemmonitor || mate-system-monitor || ukui-system-monitor || deepin-system-monitor || pantheon-system-monitor";
      };

      dock = {
        # FIXED: Explicitly turned off for full-width bar
        enabled = false;
        display_mode = "auto_hide";
        floating_ratio = 1;
        size = 1;
        only_same_output = true;
        monitors = [ ];
        pinned_apps = [ ];
        colorize_icons = false;
        pinned_static = false;
        inactive_indicators = false;
        animation_speed = 1;
      };

            network = {
        wifi_enabled = true;
        bluetooth_rssi_polling_enabled = false;
        bluetooth_rssi_poll_interval_ms = 10000;
        wifi_details_view_mode = "grid";
        bluetooth_details_view_mode = "grid";
        bluetooth_hide_unnamed_devices = false;
      };

      session_menu = {
        enable_countdown = true;
        countdown_duration = 10000;
        position = "center";
        show_header = true;
        large_buttons_style = false;
        large_buttons_layout = "grid";
        show_number_labels = true;
        power_options = [
          { action = "lock"; enabled = true; }
          { action = "suspend"; enabled = true; }
          { action = "hibernate"; enabled = true; }
          { action = "reboot"; enabled = true; }
          { action = "logout"; enabled = true; }
          { action = "shutdown"; enabled = true; }
        ];
      };

      notifications = {
        enabled = true;
        monitors = [ ];
        location = "top_right";
        overlay_layer = true;
        respect_expire_timeout = false;
        low_urgency_duration = 3;
        normal_urgency_duration = 8;
        critical_urgency_duration = 15;
        enable_keyboard_layout_toast = true;
        save_to_history = {
          low = true;
          normal = true;
          critical = true;
        };
        sounds = {
          enabled = false;
          volume = 0.5;
          separate_sounds = false;
          critical_sound_file = "";
          normal_sound_file = "";
          low_sound_file = "";
          excluded_apps = "discord,firefox,chrome,chromium,edge";
        };
      };

      osd = {
        enabled = true;
        location = "top_right";
        auto_hide_ms = 2000;
        overlay_layer = true;
        enabled_types = [ 0 1 2 4 ];
        monitors = [ ];
      };

      audio = {
        volume_step = 5;
        volume_overdrive = false;
        cava_frame_rate = 30;
        visualizer_type = "linear";
        mpris_blacklist = [ ];
        preferred_player = "";
        external_mixer = "pwvucontrol || pavucontrol";
      };

      brightness = {
        brightness_step = 5;
        enforce_minimum = true;
        enable_ddc_support = false;
      };

      theme = {
        mode = "dark";
        shell_mode = "follow";
        source = "builtin";
        builtin = "Tokyo-Night";
      };

      templates = {
        gtk = false; qt = false; kcolorscheme = false; alacritty = false;
        kitty = false; ghostty = false; foot = false; wezterm = false;
        fuzzel = false; discord = false; pywalfox = false; vicinae = false;
        walker = false; code = false; spicetify = false; telegram = false;
        cava = false; yazi = false; emacs = false; niri = false;
        hyprland = false; mango = false; zed = false; helix = false;
        enable_user_templates = false;
      };

      night_light = {
        enabled = false;
        forced = false;
        auto_schedule = true;
        night_temp = "4000";
        day_temp = "6500";
        manual_sunrise = "06:30";
        manual_sunset = "18:30";
      };

      hooks = {
        enabled = false;
        wallpaper_change = "";
        dark_mode_change = "";
        screen_lock = "";
        screen_unlock = "";
        performance_mode_enabled = "";
        performance_mode_disabled = "";
      };

      desktop_widgets = {
        enabled = false;
        grid_snap = false;
        monitor_widgets = [ ];
      };
    };
  };
}
