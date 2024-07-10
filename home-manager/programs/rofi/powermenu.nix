{ config, lib, pkgs, ... }:
with lib;
{

  let 
    cfg = config.programs.powermenu;
  in {
    options.programs.powermenu = {
      enable = mkEnableOption "Rofi powermenu";

      config = mkIf cfg.enable {
        home.packages = [ pkgs.powermenu ];
        home.file."${config.xdg.configHome}/rofi/powermenu.sh".source = pkgs.writers.writeBash "powermenu" ''
          theme="full_circle"
          dir="$HOME/.config/rofi/powermenu"
          color="nightly.rasi"
          theme="full_square.rasi"
          
          sed -i -e "s/@import .*/@import \"$color\"/g" $dir/styles/colors.rasi
          
          uptime=$(uptime | awk '{print $3}' | tr -d ',')
          rofi_command="rofi -theme $dir/$theme"
          
          ##  Options
          shutdown=""
          reboot=""
          lock=""
          suspend=""
          logout=""
          
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
              $lock) is_yes "$(confirm_exit &)" "$(readlink -f $(which betterlockscreen)) --lock"; ;;
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
      };
    };
  };
}
