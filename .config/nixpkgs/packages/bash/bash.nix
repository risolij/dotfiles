{ config, pkgs, ... }:

{
  programs.bash = {
    enable = true;
    historyControl = [
      "erasedups"
    ];
    initExtra = ''
      exitstatus() {
        if [[ $? == 0 ]]; then
          echo ':)'
        else
          echo ':('
        fi
      }
      set -o vi
      DEFAULT=$PS1
      PS1=' ❯ '
    '';
    profileExtra = ''
      ./.fehbg
    '';
    shellAliases = {
      ll = "ls -al";
      info = "info --vi-keys";
      battery = "echo Battery: $(acpi -bat | awk -F', ' '/%/ {print $2}')";
      clog = ''sudo echo "scale=2; $(cat /tmp/scan.log | wc -l) / $(find /home/req | wc -l) * 100" | bc -l | xargs -I {} echo "Percent Scanned: {}%"'';
    };
  };
}
