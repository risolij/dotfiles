{ config, lib, pkgs, ... }:

with lib;

{
  options.nix-systemd-services-scans.enable = mkOption {
    type = types.bool;
    default = false;
    description = "Enable systemd security scans";
  };

  config = mkIf config.nix-systemd-services-scans.enable {
    systemd.services = {
      clamdscan-home = {
        description = "Weekly ClamAV scan of /home/req";
        serviceConfig = {
          Type = "oneshot";
          User = "req";
          ExecStart = ''
            ${pkgs.clamav}/bin/clamdscan -m /home/req --fdpass
          '';
          StandardOutput = "append:/home/req/scans/clamdscan.txt";
          StandardError = "journal";
        };
      };

      vulnix-scan = {
        description = "Weekly vulnix system vulnerability scan";
        serviceConfig = {
          Type = "oneshot";
          User = "req";
          ExecStart = ''
            ${pkgs.vulnix}/bin/vulnix --system
          '';
          StandardOutput = "append:/home/req/scans/vulnix.txt";
          StandardError = "journal";
        };
      };
    };
    

    systemd.timers = {
      clamdscan-home = {
        wantedBy = [ "timers.target" ];
        timerConfig = {
          OnCalendar = "Sun *-*-* 00:00:00";
          Persistent = true;
          AccuracySec = "15min";
          RandomizedDelaySec = "10min";
        };
      };

      vulnix-scan = {
        wantedBy = [ "timers.target" ];
        timerConfig = {
          OnCalendar = "Sun *-*-* 00:00:00";
          Persistent = true;
          AccuracySec = "15min";
          RandomizedDelaySec = "10min";
        };
      };
    };
  };
}
