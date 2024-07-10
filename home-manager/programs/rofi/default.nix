{ config, lib, pkgs, ... }:

let 
  screenie = pkgs.writers.writeBash "screenie" ''
    dir="$HOME/.config/rofi/powermenu"
    color="nightly.rasi"
    theme="card_square.rasi"
    
    sed -i -e "s/@import .*/@import \"$color\"/g" $dir/styles/colors.rasi
    
    rofi_command="rofi -theme $dir/$theme"
    
    ##  Options
    screenshot=""
    desktop=""
    app=""
    out=""
    
    # Variable passed to rofi
    options="$screenshot\n$desktop\n$app\n$out"
    
    chosen="$(echo -e "$options" | $rofi_command -p "Screenshots" -dmenu -selected-row 2)"
    case $chosen in
        $screenshot) seq 5 -1 1 | while read line; do echo "Screenshotting: $line" | dzen2 -p 1 -h 100 -fg "#ffffff" -bg "#ff79c6" -y 500 -w 750 -x 585; done && scrot -e 'mv $f ~/Pictures/ScreenShots' -d 5; ;;
        $desktop) scrot -e 'mv $f ~/Pictures/ScreenShots' -d 1 && notify-send "Screenshotting desktop"; ;;
        $app) scrot -d 1 -s -e 'mv $f ~/Pictures/ScreenShots' && notify-send "Screenshotting application"; ;;
        $out) exit 0; ;;
        *) exit 0; ;;
    esac
  '';
in
{
  imports = [
    ./powermenu.nix
  ];

  programs.powermenu.enable = true;

  home.file."${config.xdg.configHome}/rofi/powermenu.sh".source = powermenu;
  home.file."${config.xdg.configHome}/rofi/screenie.sh".source = screenie;
  programs.rofi = {
    enable = true;
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
