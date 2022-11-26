{ pkgs, lib, config, ... }:

{
  services.cron = {
    enable = true;
    systemCronJobs = [
      "0 0 * * SUN  req clamdscan -m /home/req --fdpass > /home/req/scans/clamdscan.txt"
      "0 0 * * SUN  req vulnix --system > /home/req/scans/vulnix.txt"
    ];
  };
}
