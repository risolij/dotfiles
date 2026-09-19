{ pkgs, inputs, ... }:
{
  programs.noctalia = {
    enable = true;
    settings = {
      settings_version = 0; # v5 updated
      
      bar = {
        default = {
          position = "top";
          density = "spacious";
          show_outline = false; # v5 updated
          show_capsule = false;  # v5 updated
          use_separate_opacity = false; # v5 updated
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
                usePrimaryColor = false; # v5 updated
              }
              {
                id = "SystemMonitor"; # v5 updated
              }
              {
                id = "ActiveWindow"; # v5 updated
              }
              {
                id = "MediaMini"; # v5 updated
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
        avatar_image = "/home/req/Pictures/Wallpapers/spaceman.png"; # v5 updated
        show_screen_corners = false; # v5 updated
        force_black_screen_corners = false; # v5 updated
        scale_ratio = 1; # v5 updated
        radius_ratio = 0.5; # v5 updated
        i_radius_ratio = 0.5; # v5 updated
        box_radius_ratio = 0.5; # v5 updated
        screen_radius_ratio = 1; # v5 updated
        animation_speed = 1; # v5 updated
        animation_disabled = false; # v5 updated
        compact_lock_screen = false; # v5 updated
        lock_on_suspend = true; # v5 updated
        show_session_buttons_on_lock_screen = true; # v5 updated
        show_hibernate_on_lock_screen = false; # v5 updated
        enable_shadows = true; # v5 updated
        shadow_direction = "bottom_right"; # v5 updated
        shadow_offset_x = 2; # v5 updated
        shadow_offset_y = 3; # v5 updated
        language = "";
        allow_panels_on_screen_without_bar = true; # v5 updated
      };

      ui = {
        font_default_scale = 1; # v5 updated
        font_fixed_scale = 1; # v5 updated
        tooltips_enabled = true; # v5 updated
        panels_attached_bar = false; # v5 updated
        settings_panel_mode = "centered"; # v5 updated
        box_border_enabled = false; # v5 updated
      };

      location = {
        name = "Tokyo";
        weather_enabled = true; # v5 updated
        weather_show_effects = true; # v5 updated
        use_fahrenheit = false; # v5 updated
        use_12hour_format = false; # v5 updated
        show_week_number_calendar = false; # v5 updated
        show_calendar_events = true; # v5 updated
        show_calendar_weather = true; # v5 updated
        analog_clock_calendar = false; # v5 updated
        first_day_of_week = -1; # v5 updated
      };

      calendar = {
        cards = [
          { enabled = true; id = "calendar-header-card"; }
          { enabled = true; id = "calendar-month-card"; }
          { enabled = true; id = "timer-card"; }
          { enabled = true; id = "weather-card"; }
        ];
      };

      screen_recorder = { # v5 updated
        directory = "";
        frame_rate = 60; # v5 updated
        audio_codec = "opus"; # v5 updated
        video_codec = "h264"; # v5 updated
        quality = "very_high";
        color_range = "limited"; # v5 updated
        show_cursor = true; # v5 updated
        copy_to_clipboard = false; # v5 updated
        audio_source = "default_output"; # v5 updated
        video_source = "portal"; # v5 updated
      };

      wallpaper = {
        enabled = true;
        overview_enabled = false; # v5 updated
	default = {
	  path = "/home/req/Pictures/Wallpapers/space.jpg";
	};
        directory = "/home/req/Pictures/Wallpapers/";
        monitor_directories = [ ]; # v5 updated
        enable_multi_monitor_directories = false; # v5 updated
        recursive_search = false; # v5 updated
        set_wallpaper_on_all_monitors = true; # v5 updated
        fill_mode = "crop"; # v5 updated
        fill_color = "#000000"; # v5 updated
        use_solid_color = false; # v5 updated
        solid_color = "#1a1a2e"; # v5 updated
        random_enabled = false; # v5 updated
        wallpaper_change_mode = "random"; # v5 updated
        random_interval_sec = 300; # v5 updated
        transition_duration = 1500; # v5 updated
        transition_type = "random"; # v5 updated
        transition_edge_smoothness = 0.05; # v5 updated
        panel_position = "follow_bar"; # v5 updated
        hide_wallpaper_filenames = false; # v5 updated
        use_wallhaven = false; # v5 updated
        wallhaven_query = ""; # v5 updated
        wallhaven_sorting = "relevance"; # v5 updated
        wallhaven_order = "desc"; # v5 updated
        wallhaven_categories = "111"; # v5 updated
        wallhaven_purity = "100"; # v5 updated
        wallhaven_ratios = ""; # v5 updated
        wallhaven_api_key = ""; # v5 updated
        wallhaven_resolution_mode = "atleast"; # v5 updated
        wallhaven_resolution_width = ""; # v5 updated
        wallhaven_resolution_height = ""; # v5 updated
      };

      app_launcher = { # v5 updated
        enable_clipboard_history = false; # v5 updated
        enable_clip_preview = true; # v5 updated
        position = "center";
        pinned_execs = [ ]; # v5 updated
        use_app2unit = false; # v5 updated
        sort_by_most_used = true; # v5 updated
        terminal_command = "alacritty -e"; # v5 updated
        custom_launch_prefix_enabled = false; # v5 updated
        custom_launch_prefix = ""; # v5 updated
        view_mode = "list"; # v5 updated
        show_categories = true; # v5 updated
        icon_mode = "tabler"; # v5 updated
        ignore_mouse_input = false; # v5 updated
      };

      control_center = { # v5 updated
        position = "close_to_bar_button"; # v5 updated
        disk_path = "/"; # v5 updated
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

      system_monitor = { # v5 updated
        cpu_warning_threshold = 80; # v5 updated
        cpu_critical_threshold = 90; # v5 updated
        temp_warning_threshold = 80; # v5 updated
        temp_critical_threshold = 90; # v5 updated
        gpu_warning_threshold = 80; # v5 updated
        gpu_critical_threshold = 90; # v5 updated
        mem_warning_threshold = 80; # v5 updated
        mem_critical_threshold = 90; # v5 updated
        disk_warning_threshold = 80; # v5 updated
        disk_critical_threshold = 90; # v5 updated
        cpu_polling_interval = 3000; # v5 updated
        temp_polling_interval = 3000; # v5 updated
        gpu_polling_interval = 3000; # v5 updated
        enable_dgpu_monitoring = false; # v5 updated
        mem_polling_interval = 3000; # v5 updated
        disk_polling_interval = 3000; # v5 updated
        network_polling_interval = 3000; # v5 updated
        load_avg_polling_interval = 3000; # v5 updated
        use_custom_colors = false; # v5 updated
        warning_color = ""; # v5 updated
        critical_color = ""; # v5 updated
        external_monitor = "resources || missioncenter || jdsystemmonitor || corestats || system-monitoring-center || gnome-system-monitor || plasma-systemmonitor || mate-system-monitor || ukui-system-monitor || deepin-system-monitor || pantheon-system-monitor"; # v5 updated
      };

      dock = {
        # FIXED: Explicitly turned off for full-width bar
        enabled = false;
        display_mode = "auto_hide"; # v5 updated
        floating_ratio = 1; # v5 updated
        size = 1;
        only_same_output = true; # v5 updated
        monitors = [ ];
        pinned_apps = [ ]; # v5 updated
        colorize_icons = false; # v5 updated
        pinned_static = false; # v5 updated
        inactive_indicators = false; # v5 updated
        animation_speed = 1; # v5 updated
      };

            network = {
        wifi_enabled = true; # v5 updated
        bluetooth_rssi_polling_enabled = false; # v5 updated
        bluetooth_rssi_poll_interval_ms = 10000; # v5 updated
        wifi_details_view_mode = "grid"; # v5 updated
        bluetooth_details_view_mode = "grid"; # v5 updated
        bluetooth_hide_unnamed_devices = false; # v5 updated
      };

      session_menu = { # v5 updated
        enable_countdown = true; # v5 updated
        countdown_duration = 10000; # v5 updated
        position = "center";
        show_header = true; # v5 updated
        large_buttons_style = false; # v5 updated
        large_buttons_layout = "grid"; # v5 updated
        show_number_labels = true; # v5 updated
        power_options = [ # v5 updated
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
        overlay_layer = true; # v5 updated
        respect_expire_timeout = false; # v5 updated
        low_urgency_duration = 3; # v5 updated
        normal_urgency_duration = 8; # v5 updated
        critical_urgency_duration = 15; # v5 updated
        enable_keyboard_layout_toast = true; # v5 updated
        save_to_history = { # v5 updated
          low = true;
          normal = true;
          critical = true;
        };
        sounds = {
          enabled = false;
          volume = 0.5;
          separate_sounds = false; # v5 updated
          critical_sound_file = ""; # v5 updated
          normal_sound_file = ""; # v5 updated
          low_sound_file = ""; # v5 updated
          excluded_apps = "discord,firefox,chrome,chromium,edge"; # v5 updated
        };
      };

      osd = {
        enabled = true;
        location = "top_right";
        auto_hide_ms = 2000; # v5 updated
        overlay_layer = true; # v5 updated
        enabled_types = [ 0 1 2 4 ]; # v5 updated
        monitors = [ ];
      };

      audio = {
        volume_step = 5; # v5 updated
        volume_overdrive = false; # v5 updated
        cava_frame_rate = 30; # v5 updated
        visualizer_type = "linear"; # v5 updated
        mpris_blacklist = [ ]; # v5 updated
        preferred_player = ""; # v5 updated
        external_mixer = "pwvucontrol || pavucontrol"; # v5 updated
      };

      brightness = {
        brightness_step = 5; # v5 updated
        enforce_minimum = true; # v5 updated
        enable_ddc_support = false; # v5 updated
      };

      # FIXED: Rewritten into native v5 snake_case and Tokyo Night preset mapping
      color_chemes = { 
        source = "predefined";
        palette = "Tokyo Night";
        dark_mode = true;
        scheduling_mode = "off";
        manual_sunrise = "06:30";
        manual_sunset = "18:30";
        matugen_scheme_type = "scheme-fruit-salad";
        generate_templates_for_predefined = true;
      };

      templates = {
        gtk = false; qt = false; kcolorscheme = false; alacritty = false;
        kitty = false; ghostty = false; foot = false; wezterm = false;
        fuzzel = false; discord = false; pywalfox = false; vicinae = false;
        walker = false; code = false; spicetify = false; telegram = false;
        cava = false; yazi = false; emacs = false; niri = false;
        hyprland = false; mango = false; zed = false; helix = false;
        enable_user_templates = false; # v5 updated
      };

      night_light = { # v5 updated
        enabled = false;
        forced = false;
        auto_schedule = true; # v5 updated
        night_temp = "4000"; # v5 updated
        day_temp = "6500"; # v5 updated
        manual_sunrise = "06:30"; # v5 updated
        manual_sunset = "18:30"; # v5 updated
      };

      hooks = {
        enabled = false;
        wallpaper_change = ""; # v5 updated
        dark_mode_change = ""; # v5 updated
        screen_lock = ""; # v5 updated
        screen_unlock = ""; # v5 updated
        performance_mode_enabled = ""; # v5 updated
        performance_mode_disabled = ""; # v5 updated
      };

      desktop_widgets = { # v5 updated
        enabled = false;
        grid_snap = false; # v5 updated
        monitor_widgets = [ ]; # v5 updated
      };
    };
  };
}
