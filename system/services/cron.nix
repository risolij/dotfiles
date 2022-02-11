{ pkgs, lib, config, ... }:

{
  services.cron = {
    enable = true;
    systemCronJobs = [
      "0 0 * * *    req curl -X GET https://download.dnscrypt.info/blacklists/domains/mybase.txt > /tmp/blacklist.txt"
      "0 */4 * * *  req clamdscan -m /home/req --fdpass > /home/req/logs/lastscan.txt"
    ];
  };
}
