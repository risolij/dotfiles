{ config, pkgs, ... }:

{
  networking.networkmanager.enable = true;
  ## nmcli device wifi list
  ## nmcli device wifi connect "wifi-name" password "password"

  ## ethtool -k wlp0s20f3
    ## tx-tcp-segmentation off
  services.udev.extraRules = ''
    ACTION=="add", SUBSYSTEM=="net", NAME=="wlp0s20f3", RUN+="${pkgs.ethtool}/bin/ethtool -K wlp0s20f3 tso off"
  '';
}
