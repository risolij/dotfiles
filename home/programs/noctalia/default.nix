{ pkgs, config, lib, ... }:
let
    carouselCfg = config.services.noctalia.wallpaperCarousel;
in
{
    imports = [
        ./plugins
    ];

    services.noctalia.wallpaperCarousel = {
        enable = true;
        wallpaperDir = "/home/req/Pictures/Wallpapers";
        blurBackground = true;
        transitionDuration = 300;
    };

    programs.noctalia = {
        enable = true;
        settings = {
            plugins = {
	            enabled = [ "yngwe/wallpaperCarousel"];
                wallpaperCarousel = {
                  directory = toString carouselCfg.wallpaperDir;
                  blurBackground = carouselCfg.blurBackground;
                  transitionDuration = carouselCfg.transitionDuration;
                };
            };

            bar = {
                default = {
                    position = "top";
	                capsule = true;
	                capsule_padding = 10;
	                capsule_radius = 4;
                    margin_ends = 100.0;
	                margin_edge = 10;
	                background_opacity = 1.0;
	                widget_spacing = 10;
	                icon_color = "tertiary";
                    reserve_space = true;
                    radius = 4;
                    scale = 1.2;
                    font_scale = 1.0;
	                concave_edge_corners = false;
                    thickness = 55;
                    start = [
	                    "launcher"
                        "workspaces"
                        "media"
	                ];
                    center = [
                        "clock"
	                    "clipboard"
	                    "wallpaper"
                    ];
                    end = [
                        "taskbar"
	                    "screenshot"
                        "notifications"
                        "volume"
                        "brightness"
                        "battery"
                        "sysmon"
                        "control-center"
                    ];
                };

                monitors = [ ];
            };

            widget = {
                launcher = {
                    glyph = "rocket";
                };

	            control-center = {
	                glyph = "skull";
	            };
            };

            shell = {
	            clipboard_enabled = true;

	            animation = {
	                enabled = true;
	                speed = 1.0;
	            };

                panel = {
	                control_center_placement = "floating";
	                wallpaper_placement = "floating";
	            };

	            launcher = {
	                app_grid = true;
	            };
            };

            desktop_widgets = {
                schema_version = 2;
    	        widget_order = [ "audio" ];

    	        grid = {
    	            cell_size = 16;
    	            major_interval = 4;
    	            visible = false;
    	        };

    	        widget = {
    	            "audio" = {
    	                type = "audio_visualizer";
    	                output = "eDP-1";
    	                cx = 960.0;
    	                cy = 1026.0;
    	                box_width = 1920.0;
    	                box_height = 108.0;
    	                rotation = 0.0;

    	                settings = {
	                        background = false;
    	                    bands = 32;
    	                    show_when_idle = true;
	                        centered = false;
	                        color_1 = "primary";
	                        color_2 = "secondary";
    	                };
    	            };
    	        };
            };

            location = {
                auto_locate = false;
                address = "Tokyo, Japan";
            };
    
            weather = {
                enabled = true;
                unit = "metric";
            };
    
            calendar = {};

            wallpaper = {
                enabled = true;
	            default = {
	                path = "/home/req/Pictures/Wallpapers/samurai-light-1920x1080.png";
	            };
                directory = "/home/req/Pictures/Wallpapers/";
                fill_mode = "crop";
                fill_color = "#000000";
                transition_duration = 1500;
            };

            control_center = {
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
            };

            osd = {
                enabled = true;
                monitors = [ ];
            };

            audio = {};
            brightness = {};

            theme = {
                mode = "dark";
                shell_mode = "follow";
                source = "builtin";
                builtin = "Tokyo-Night";
            };

            hooks = {};
        };
    };
}
