# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  networking = {
    hostName = "nixos";
    useDHCP = false;
    nameservers = [ "127.0.0.1" "::1" ];
    interfaces.wlp0s20f3.useDHCP = true;
    wireless = {
      environmentFile = /home/req/keys/wireless.env;
      enable = true;
      interfaces = [ "wlp0s20f3" ];
      networks = {
        Impossible = {
          pskRaw = "@PSK_HOME@";
          authProtocols = [ "WPA-PSK" ];
        };
      };
    };
  };
}
    ## resolvconf.useLocalResolver = true;
    ## dhcpcd.extraConfig = "nohook resolv.conf";
    ## extraHosts = ''
    ##   @CONTROL@ control
    ##   @NODE01@ node01
    ##   @NODE02@ node02'';
