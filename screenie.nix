{ config, lib, pkgs, ... }:
with lib;

let 
  cfg = config.programs.screenie;
  name = "screenie";
in
{
  options.programs.${name} = {
    enable = mkEnableOption "Rofi ${name}";
  };

  config = mkIf cfg.enable {
    home.file."${config.xdg.configHome}/rofi/${name}.sh".source = pkgs.writers.writeBash "${name}" ''
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
  };
}

