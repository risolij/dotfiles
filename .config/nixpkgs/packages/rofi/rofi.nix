{ config, lib, pkgs, ... }:

let 
  writeBashScript = name: text: pkgs.writeTextFile {
    inherit name text;
    executable = true;
    checkPhase = ''
      ${pkgs.stdenv.shell} -n $out
    '';
  };
in

{
  home.file."${config.xdg.configHome}/rofi/powermenu.sh".source = writeBashScript "powermenu.sh" ''
    #!/run/current-system/sw/bin/bash

    theme="full_circle"
    dir="$HOME/.config/rofi/powermenu"
    color="mask.rasi"
    theme="full_square.rasi"
    
    sed -i -e "s/@import .*/@import \"$color\"/g" $dir/styles/colors.rasi
    
    uptime=$(uptime | awk '{print $3}' | tr -d ',')
    rofi_command="rofi -theme $dir/$theme"
    
    ##  Options
    shutdown=""
    reboot=""
    lock=""
    suspend=""
    logout=""
    
    # Confirmation
    confirm_exit() {
        rofi -dmenu                 \
        	-i                      \
        	-no-fixed-num-lines     \
        	-p "Are You Sure? : "   \
        	-theme $dir/confirm.rasi
    }
    
    is_yes() {
        local ans="$1"
        local com="$2"
    
        case "$ans" in 
            [yY][eE][sS]|[yY]) $com; ;;
            [Nn][oO]|[nN]) exit 0; ;;
            *) msg ; ;;
        esac
    }
    
    # Message
    msg() {
        rofi -theme "$dir/message.rasi" -e "Available Options  -  yes / y / no / n"
    }
    
    # Variable passed to rofi
    options="$shutdown\n$reboot\n$lock\n$suspend\n$logout"
    
    chosen="$(echo -e "$options" | $rofi_command -p "Uptime: $uptime" -dmenu -selected-row 2)"
    case $chosen in
        $shutdown)
            ans=$(confirm_exit &)
            is_yes "$ans" "systemctl poweroff"
            ;;
        $reboot)
            ans=$(confirm_exit &)
            is_yes "$ans" "systemctl reboot"
            ;;
        $lock) readlink -f $(which betterlockscreen) -l; ;;
        $suspend)
            ans=$(confirm_exit &)
            is_yes "$ans" "systemctl suspend"
            ;;
        $logout)
            ans=$(confirm_exit &)
            is_yes "$ans" "loginctl terminate-user $USER"
            ;;
    esac
  '';
  home.file."${config.xdg.configHome}/rofi/screenie.sh".source = writeBashScript "screenie.sh" ''
    #!/run/current-system/sw/bin/bash
    
    dir="$HOME/.config/rofi/powermenu"
    color="mask.rasi"
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
        $screenshot) notify-send "Screenshotting in 5 seconds" && scrot -e 'mv $f ~/Pictures/ScreenShots' -d 5; ;;
        $desktop) scrot -e 'mv $f ~/Pictures/ScreenShots' -d 1 && notify-send "Screenshotting desktop"; ;;
        $app) scrot -d 1 -s -e 'mv $f ~/Pictures/ScreenShots' && notify-send "Screenshotting application"; ;;
        $out) exit 0; ;;
        *) exit 0; ;;
    esac
  '';
  programs.rofi = {
    enable = true;
    cycle = true;
    configPath = "${config.xdg.configHome}/rofi/config.rasi";
    extraConfig = {
      modi = "drun,ssh,filebrowser";
      show-icons = true;
      icon-theme = "Papirus";
    };

    theme = 
      let 
        inherit (config.lib.formats.rasi) mkLiteral;
      in {
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
