# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  networking = {
    hostName = "nixos";
    useDHCP = false;
    interfaces.wlp0s20f3.useDHCP = true;
    wireless = {
      environmentFile = /home/req/keys/wireless.env;
      enable = true;
      interfaces = [ "wlp0s20f3" ];
      networks = {
        Impossible = {
          hidden = true;
          pskRaw = "@PSK_HOME@";
          authProtocols = [ "WPA-PSK" ];
        };
      };
    };
}
