# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  networking.networkmanager.enable = true;
  ## nmcli device wifi list
  ## nmcli device wifi connect "wifi-name" password "password"

  ## ethtool -K eth0 tso off
  ## ethtool -K eth0 gso off
  services.udev.extraRules = ''
    ACTION=="add", SUBSYSTEM=="net", NAME=="wlp0s20f3", RUN+="${pkgs.ethtool}/bin/ethtool -K wlp0s20f3 tso off"
  '';
}
