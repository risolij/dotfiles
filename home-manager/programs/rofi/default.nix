{ config, lib, pkgs, ... }:

{
  imports = [
    ./powermenu.nix
    ./screenie.nix
  ];

  programs.powermenu.enable = true;
  programs.screenie.enable = true;

  programs.rofi = {
    enable = true;
    package = pkgs.rofi-wayland;
    cycle = true;
    configPath = "${config.xdg.configHome}/rofi/config.rasi";
    extraConfig = {
      modi = "drun,ssh,filebrowser";
      show-icons = true;
      icon-theme = "Arc";
    };

    theme = 
      let 
        inherit (config.lib.formats.rasi) mkLiteral;
      in
      {
        "*" = {
          background-color = mkLiteral "#282a36";
          text-color = mkLiteral "#f8f8f2";
        };

        "window" = {
          padding = mkLiteral "1em";
          border = mkLiteral "none";
          width = mkLiteral "800px";
          height = mkLiteral "500px";
          background-color = mkLiteral "#282a36";
        };

        "mainbox" = {
          spacing = mkLiteral "0px";
          children = mkLiteral "[inputbar,listview,wrapper-mode-switcher]";
        };

        "element" = {
          background = mkLiteral "#282a36";
          children = mkLiteral "[ element-icon, element-text ]";
        };
        
        "element,element-text,element-icon, button" = {
          cursor = mkLiteral "pointer";
        };
        
        "inputbar" = {
          margin = mkLiteral "0px 0px 0.5em 0em";
          spacing = mkLiteral "0.2em";
          children = mkLiteral "[ button-clipboard, entry,overlay,case-indicator ]";
        };
        
        "entry" = {
          background-color = mkLiteral "transparent";
          padding = mkLiteral "10px";
          border-radius = mkLiteral "10px";
        };
        
        "button-clipboard" = {
          padding = mkLiteral "10px";
          expand = mkLiteral "false";
          content = "❯";
          action = "kb-primary-paste";
        };
        
        "listview, inputbar, message" = {
          padding = mkLiteral "0.5em";
          border = mkLiteral "none";
          background-color = mkLiteral "#282a36";
          columns = mkLiteral "4";
          lines = mkLiteral "4";
        };
        
        "listview" = {
          border = mkLiteral "0px";
          border-radius = mkLiteral "0px";
        };
        
        "element" = {
          border = mkLiteral "0";
          padding = mkLiteral "10px";
          font = "Mono 8";
          orientation = mkLiteral "vertical";
        };
        
        "element-icon" = {
          size = mkLiteral "6em";
          horizontal-align = mkLiteral "0.5";
        };
        
        "element-icon selected" = {
          background-color = mkLiteral "#44475a";
        };
        
        "element selected" = {
          border-radius = mkLiteral "10px";
          background-color = mkLiteral "#44475a";
        };
        
        "element-text" = {
          font = mkLiteral "inherit";
          horizontal-align = mkLiteral "0.5";
          background-color = mkLiteral "transparent";
        };
        
        "wrapper-mode-switcher" = {
          orientation = mkLiteral "horizontal";
          expand = mkLiteral "false";
          spacing = mkLiteral "0";
          children = mkLiteral "[ mode-switcher ]";
        };
        
        "icon-ms-ic1" = {
          filename = "go-previous";
        };
        
        "mode-switcher" = {
          border = mkLiteral "none";
          spacing = mkLiteral "0px";
          expand = mkLiteral "true";
        };
        
        "button" = {
          text-color = mkLiteral "#f8f8f2";
          border-radius = mkLiteral "0px";
          horizontal-align = mkLiteral "0.5";
          padding = mkLiteral "10px";
          background-color = mkLiteral "#282a36";
        };
        
        "button selected.normal" = {
          text-color = mkLiteral "#282a36";
          background-color = mkLiteral "#ff79c6";
          margin = mkLiteral "0px";
          padding = mkLiteral "0px";
          border-color = mkLiteral "#bd93f9";
          border-radius = mkLiteral "5px";
        };
      };
  };
}
