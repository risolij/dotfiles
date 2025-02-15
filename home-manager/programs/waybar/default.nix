{ config, pkgs, lib, ...}:

{
  programs.waybar = {
    enable = true;
    systemd.enable = true;
    settings = [{
      layer = "top";
      position = "top";
      margin = "9 13 -10 18";
      modules-left = [ "hyprland/workspaces" "hyprland/language" "keyboard-state" "hyprland/window" ];
      modules-center = [ "clock" "custom/weather" ];
      modules-right = [ "pulseaudio" "temperature" "custom/mem" "cpu" "network" "battery" ]; 

      "hyprland/workspaces" = {
        format = "{icon}";
        all-outputs = true;
        on-click = "activate";
        format-icons = {
          "1" = "  ";
          "2" = "  ";
          "3" = "  ";
          "4" = "  ";
          "5" = "  ";
          "6" = "  ";
          "7" = "  ";
          "8" = "  ";
          active = "  ";
        };
      };

      "hyprland/language" = {
        format-en = "US";
        min-length = 5;
        tooltip = false;
      };

      keyboard-state = {
        capslock = true;
        format = "{icon} ";
        format-icons = {
          locked = "";
          unlocked = "";
        };
      };

      clock = {
        timezone = "America/Phoenix";
        tooltip-format = "<big>{:%Y %B}</big>\n<tt><small>{calendar}</small></tt>";
        format = "{:%a, %d %b, %I:%M %p}";
      };

      "custom/weather" = {
        format = "{}°";
        tooltip = true;
        interval = 3600;
        exec = "wttrbar --fahrenheit";
        return-type = "json";
      };
      
      pulseaudio = {
          reverse-scrolling = 1;
          format = "{volume}% {icon} {format_source}";
          format-bluetooth = "{volume}% {icon} {format_source}";
          format-bluetooth-muted = " {icon} {format_source}";
          format-muted = " {format_source}";
          format-source = "{volume}% ";
          format-source-muted = "";
          format-icons = {
              headphone = "";
              hands-free = "";
              headset = "";
              phone = "";
              portable = "";
              car = "";
              default = ["" "" ""];
          };
          on-click = "pavucontrol";
          min-length = 13;
      };
      
      "custom/mem" = {
        format = "{} ";
        interval = 3;
        exec = "free -h -t | tail -n1 | awk '{print $3}'";
        tooltip = false;
      };

      cpu = {
        interval = 2;
        format = "{usage}% ";
        min-length = 6;
      };

      temperature = {
        critical-threshold = 80;
        format = "{temperatureC}°C {icon}";
        format-icons = ["" "" "" "" ""];
        tooltip = false;
      };

      network = {
        format-wifi = " ";
        format-ethernet = "";
        format-disconnected = "";
        tooltip = false;
      };

      battery = {
        interval = 60;
        states = {
          good = 80;
          warning = 30;
          critical = 15;
        };
        format = "{capacity}% {icon}";
        format-charging = "{capacity}% ";
        format-full = "{capacity}% ";
        format-icons = [ " " " " " " " " " " ];
      };

    }];
    style = ''
    * {
        border: none;
        border-radius: 0;
        /* `otf-font-awesome` is required to be installed for icons */
        font-family: FontAwesome, JetBrains Mono Bold, sans-serif;
        min-height: 20px;
    }
    
    window#waybar {
        background: transparent;
    }
    
    window#waybar.hidden {
        opacity: 0.2;
    }
    
    #workspaces {
        margin-right: 8px;
        border-radius: 10px;
        transition: none;
        background: #383c4a;
    }

    #workspaces button {
        transition: none;
        background: transparent;
        padding: 5px;
        font-size: 16px;
        color: white;
    }

    #workspaces button.empty {
        color: lightgrey;
        background: transparent;
    }

    #workspaces button:hover {
        transition: none;
        box-shadow: inherit;
        text-shadow: inherit;
        border-radius: inherit;
        color: white;
        background: #7c818c;
    }
    
    #workspaces button.active {
        background: transparent;
        color: #F8814C;
        border-radius: inherit;
    }

    #workspaces button.active:hover {
        color: #F8814C;
        background: #7c818c;
    }

    #workspaces button.empty:hover {
        color: lightgrey;
    }
    
    #language {
        padding-left: 10px;
        padding-right: 10px;
        border-radius: 10px 0px 0px 10px;
        transition: none;
        color: #ffffff;
        background: #383c4a;
    }
    
    #keyboard-state {
        margin-right: 8px;
        padding-right: 16px;
        border-radius: 0px 10px 10px 0px;
        transition: none;
        color: #ffffff;
        background: #383c4a;
    }
    
    #custom-pacman {
        padding-left: 16px;
        padding-right: 8px;
        border-radius: 10px 0px 0px 10px;
        transition: none;
        color: #ffffff;
        background: #383c4a;
    }
    
    #custom-mail {
        margin-right: 8px;
        padding-right: 16px;
        border-radius: 0px 10px 10px 0px;
        transition: none;
        color: #ffffff;
        background: #383c4a;
    }
    
    #submap {
        padding-left: 16px;
        padding-right: 16px;
        border-radius: 10px;
        transition: none;
        color: #ffffff;
        background: #383c4a;
    }
    
    #clock {
        padding-left: 16px;
        padding-right: 16px;
        border-radius: 10px 0px 0px 10px;
        transition: none;
        color: #ffffff;
        background: #383c4a;
    }
    
    #custom-weather {
        padding-right: 16px;
        border-radius: 0px 10px 10px 0px;
        transition: none;
        color: #ffffff;
        background: #383c4a;
    }
    
    #pulseaudio {
        margin-right: 8px;
        padding-left: 16px;
        padding-right: 16px;
        border-radius: 10px;
        transition: none;
        color: #ffffff;
        background: #383c4a;
    }
    
    #pulseaudio.muted {
        background-color: #90b1b1;
        color: #2a5c45;
    }
    
    #network {
        margin-right: 8px;
        padding-left: 16px;
        padding-right: 16px;
        border-radius: 10px;
        transition: none;
        color: #ffffff;
        background: #383c4a;
    }

    #custom-mem {
        margin-right: 8px;
        padding-left: 16px;
        padding-right: 16px;
        border-radius: 10px;
        transition: none;
        color: #ffffff;
        background: #383c4a;
    }
    
    #cpu {
        margin-right: 8px;
        padding-left: 16px;
        padding-right: 16px;
        border-radius: 10px;
        transition: none;
        color: #ffffff;
        background: #383c4a;
    }
    
    #temperature {
        margin-right: 8px;
        padding-left: 16px;
        padding-right: 16px;
        border-radius: 10px;
        transition: none;
        color: #ffffff;
        background: #383c4a;
    }
    
    #temperature.critical {
        background-color: #eb4d4b;
    }
    
    #backlight {
        margin-right: 8px;
        padding-left: 16px;
        padding-right: 16px;
        border-radius: 10px;
        transition: none;
        color: #ffffff;
        background: #383c4a;
    }
    
    #battery {
        margin-right: 8px;
        padding-left: 16px;
        padding-right: 16px;
        border-radius: 10px;
        color: white;
        background: lightblue;
    }

    #battery.good {
        background: green;
        color: white;
    }

    #battery.warning {
        background: orange;
        color: white;
    }

    #battery.critical {
        background: red;
        color: white;
    }
    
    #battery.charging {
        color: white;
        background: gold;
    }

    #battery.full {
        color: white;
        background: lightblue;
    }
    
    #battery.warning:not(.charging) {
        background-color: #ffbe61;
        color: black;
    }
    
    #battery.critical:not(.charging) {
        background-color: #f53c3c;
        color: #ffffff;
        animation-name: blink;
        animation-duration: 0.5s;
        animation-timing-function: linear;
        animation-iteration-count: infinite;
        animation-direction: alternate;
    }
    
    #tray {
        padding-left: 16px;
        padding-right: 16px;
        border-radius: 10px;
        transition: none;
        color: #ffffff;
        background: #383c4a;
    }
    
    @keyframes blink {
        to {
            background-color: #ffffff;
            color: #000000;
        }
    }
    '';
  };
}
