{ config, pkgs, lib, ...}:

let
  inherit (pkgs.lib) optionals optional;
in
{
  nixpkgs.overlays = [
    (final: prev: {
      waybar =
        let
          hyprctl = "${pkgs.hyprland}/bin/hyprctl";
          waybarPatchFile = import ./workspace-patch.nix { inherit pkgs hyprctl; };
        in
        prev.waybar.overrideAttrs (oldAttrs: {
          mesonFlags = oldAttrs.mesonFlags ++ [ "-Dexperimental=true" ];
          patches = (oldAttrs.patches or [ ]) ++ [ waybarPatchFile ];
        });
    })
  ];

  programs.waybar = {
    enable = true;
    systemd.enable = true;
    settings = [{
      layer = "top";
      position = "top";
      margin = "10 20 0 20";
      height = 50;
      modules-left = [ "custom/nixos" "hyprland/workspaces" ];
      modules-center = [ "clock" ];
      modules-right = [ "custom/cava" "network" "battery" "custom/power" ];

      "custom/cava" = {
        exec = "cava -p ~/.config/cava/config";
        tooltip = false;
      };

      "custom/nixos" = {
        format = "   ";
        tooltip = false;
        on-click = "rofi -combi-modi window,drun,ssh,filebrowser --show-icons -show drun";
      };

      "custom/power" = {
        format = "";
        tooltip = false;
        on-click = "wlogout";
      };

      "hyprland/workspaces" = {
        format = "{icon}";
        on-click = "activate";
        format-icons = {
          "1" = "";
          "2" = "";
          "3" = "";
          "4" = "";
        };
      };

      "wlr/scratchpad" = {
        format = "{icon} {count}";
        show-empty = false;
        format-icons = ["" ""];
        tooltip = true;
        tooltip-format = "{app}: {title}";
      };

      clock = {
        timezone = "America/Phoenix";
        tooltip-format = "<big>{:%Y %B}</big>\n<tt><small>{calendar}</small></tt>";
        format-alt = "{:%Y-%m-%d}";
      };

      battery = {
        bat = "BAT1";
        interval = 60;
        states = {
          good = 95;
          warning = 30;
          critical = 15;
        };
        format = "{icon}";
        format-charging = "";
        format-plugged = "";
        format-icons = ["" "" "" "" ""];
      };

      network = {
        format-wifi = "";
        format-ethernet = "";
        format-disconnected = "";
        tooltip = false;
      };
    }];
    style = ''
      * {
        font-size: 16px;
      }

      window#waybar {
        background: rgba(0, 0, 0, .5);
        color: #AAB2BF;
        border-radius: 5px;
        transition-duration: 0.5s;
      }

      #workspaces button {
        background: #9a9a9a;
        color: white;
        text-shadow: 1px 1px 1px #333;
        margin: 10px 5px;
        padding: 0px 10px;
        opacity: .3;
      }

      #workspaces button.active {
        background: #0096FF;
        box-shadow: 0 0 4px 1px #0096FF;
        opacity: 1;
      }

      #battery, 
      #battery-plugged, 
      #battery-charging, 
      #network, 
      #network-disconnected {
        margin: 10px 5px;
      }

      #battery-plugged, #battery.charging, #battery.good {
        color: #0096FF;
      }

      #network {
        color: #0096FF;
      }

      #network-disconnected {
        color: red;
      }

      #custom-power {
        color: white;
        text-shadow: 1px 1px 1px #333;
        padding: 0px 10px;
        border-radius: 5px;
        background: red;
        margin: 10px 25px 10px 25px;
      }

      #custom-nixos {
        background-image: url("/home/req/Pictures/logos/nixos.png");
        background-size: cover;
        text-shadow: 1px 1px 1px #333;
        padding: 0px 10px;
        margin: 10px 20px;
      }

      #battery {
        color: #0096FF;
      }
    '';
  };
}
