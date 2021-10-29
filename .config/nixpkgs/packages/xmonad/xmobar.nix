{ config, lib, pkgs, ... }:

with lib;

{
  config = {
    programs.xmobar = {
      enable = true;
      extraConfig = ''
        Config
          { font        = "Fira Code"
          , borderColor = "#222"
          , border      = FullB
          , borderWidth = 3
          , bgColor     = "#222"
          , fgColor     = "grey"
          , position    = TopSize C 100 50
          , commands    =
              [ Run Cpu ["-t", "cpu: <fc=#ff79c6><bar> <total>%</fc>"] 10
              , Run Network "wlp0s20f3" ["-S", "True", "-t", "wlp0s20f3: <fc=#ff79c6><rx></fc>/<fc=#ff79c6><tx></fc>"] 10
              , Run Memory ["-t","mem: <fc=#ff79c6><usedbar> <usedratio>%</fc>"] 10
              , Run Date "date: <fc=#ff79c6>%a %d %b %Y %H:%M:%S</fc>" "date" 10
              , Run Battery ["-t", "<acstatus>"
                            , "-L", "10", "-H", "80"
                            , "-l", "red", "-h", "green"
                            , "--", "-O", "charging", "-o", "battery: <left>%"
                            ] 10
              , Run StdinReader
              ]
          , sepChar     = "%"
          , alignSep    = "}{"
          , template    = " %StdinReader% }{ %wlp0s20f3% | %cpu% | %memory% | %date% | %battery% "
          }
      '';
    };
  };
}
