{ config, pkgs, ... }:
let 
  BBLACK = ''\[\033[01;40m\]'';
  BRED = ''\[\033[01;41m\]'';
  BGREEN  = ''\[\033[01;42m\]'';
  BYELLOW = ''\[\033[01;43m\]'';
  BBLUE = ''\[\033[01;44m\]'';
  BMAGENTA = ''\[\033[01;45m\]'';
  BCYAN = ''\[\033[01;46m\]'';
  BWHITE = ''\[\033[01;47m\]'';
  BLACK = ''\[\033[01;30m\]'';
  RED = ''\[\033[01;31m\]'';
  GREEN = ''\[\033[01;32m\]'';
  YELLOW = ''\[\033[01;33m\]'';
  BLUE = ''\[\033[01;34m\]'';
  MAGENTA = ''\[\033[01;35m\]'';
  CYAN = ''\[\033[01;36m\]'';
  WHITE = ''\[\033[01;37m\]'';
  PS_CLEAR = ''\[\033[0m\]'';
in
{
  programs.bash = {
    enable = true;

    historyControl = [
      "erasedups"
    ];

    bashrcExtra = ''
      PS1='${MAGENTA}[\u@\H \$]${PS_CLEAR}${GREEN} ❯ ${PS_CLEAR}'
    '';

    initExtra = ''
      set -o vi
    '';

    profileExtra = ''
      . "./.fehbg"
    '';

    shellAliases = {
      jctl = "journalctl -p3 -xb";
      cat = "bat --style=plain";
      info = "info --vi-keys";
      battery = "acpi -bat | grep 'Battery 1' | awk '{print $4}' | tr -d ','";
      clog = ''sudo echo "scale=2; $(cat /tmp/scan.log | wc -l) / $(find /home/req | wc -l) * 100" | bc -l | xargs -I {} echo "Percent Scanned: {}%"'';
      screenshot = ''scrot --select --line width=2,color=Gold,style=dash --freeze'';
      nix-upgrade = ''nix-channel --update && sudo nix-channel --update && sudo nixos-rebuild switch --upgrade'';
    };

  };
}
