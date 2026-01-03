{ pkgs, lib, config, ... }:
{
  services.udev = {
    enable = true;
    extraRules = ''
      ACTION=="add", SUBSYSTEM=="net", NAME=="wlp0s20f3", RUN+="${pkgs.ethtool}/bin/ethtool -K wlp0s20f3 tso off"
  '';
  };
}

