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
  home.file."${config.xdg.configHome}/xmobar/cpu_temp.sh".source = writeBashScript "cpu_temp.sh" ''
    #!/run/current-system/sw/bin/bash
    warm=70
    hot=85
    current=$(sensors | grep -i 'package id 0' | awk '{print $4}' | tr -d '+C°' | sed 's/\..//g')

    if [ "$current" -ge "$hot" ]; then
        echo "cpu: <fc=#C1514E>$current</fc>°C";
    elif [ "$current" -ge "$warm" ]; then
        echo "cpu: <fc=#C1A24E>$current</fc>°C";
    else
        echo "cpu: <fc=#AAC0F0>$current</fc>°C";
    fi
  '';

  home.file."${config.xdg.configHome}/xmobar/battery.sh".source = writeBashScript "battery.sh" ''
    #!/run/current-system/sw/bin/bash
    battery_line=$(acpi -bat | head -n1 | awk '{print $3,$4}' | tr -d ',' | tr '[:upper:]' '[:lower:]')
    status=$(echo "$battery_line" | awk '{print $1}')
    percentage=$(echo "$battery_line" | awk '{print $2}' | tr -d '%')
    charging=" "

    determine_charge() {
      local empty=
      local low=
      local quarter=
      local half=
      local three_quart=
      local full=

      if [ "$1" -le 5 ]; then
          echo "$empty"
      elif [ "$1" -lt 25 ]; then
          echo "$low"
      elif [ "$1" -lt 50 ]; then
          echo "$quarter"
      elif [ "$1" -lt 75 ]; then
          echo "$half"
      elif [ "$1" -lt 95 ]; then
          echo "$three_quart"
      else 
          echo "$full"
      fi
    }

    if [ "$status" == "charging" ]; then
        echo "$charging"
    else
        determine_charge "$percentage"
    fi
  '';
  home.file."${config.xdg.configHome}/xmobar/home.sh".source = writeBashScript "home.sh" ''
    #!/run/current-system/sw/bin/bash
    
    percentage=$(df -hP /home | awk '{print $5}' | tail -n1)
    echo " $percentage"
  '';

    
    programs.xmobar = {
      enable = true;
      extraConfig = ''
        Config
          { font        = "xft:SFNS Display:size=10,FontAwesome:size=10"
          , additionalFonts =
             [ "xft:FontAwesome 6 Free Solid:pixelsize=14"
             , "xft:FontAwesome 6 Free Solid"
             , "xft:FontAwesome:pixelsize=10:bold"
             , "xft:FontAwesome 6 Free Solid:pixelsize=16"
             ]
          , borderColor = "#222"
          , border      = FullB
          , borderWidth = 3
          , bgColor     = "#222"
          , fgColor     = "grey"
          , position    = TopSize C 100 50
          , commands    =
              [ Run Com "${config.xdg.configHome}/xmobar/cpu_temp.sh" [] "cpu" 10
              , Run Com "${config.xdg.configHome}/xmobar/home.sh" [] "home" 300
              , Run Date "%a, %d %b  <fn=1></fn>  %H:%M:%S" "date" 10
              , Run Memory ["-t"," <fc=#ff79c6><usedbar> <usedratio>%</fc>"] 10

              , Run Network "wlp0s20f3" ["-S", "True", "-t", "wlp0s20f3: <fc=#ff79c6><rx></fc>/<fc=#ff79c6><tx></fc>"] 10
              , Run Com "${config.xdg.configHome}/xmobar/battery.sh" [] "battery" 10
              , Run StdinReader
              ]
          , sepChar     = "%"
          , alignSep    = "}{"
          , template    = " %StdinReader% } %date% { %wlp0s20f3%    %cpu%    %memory%    %home%    %battery%    "
          }
      '';
    };
}
