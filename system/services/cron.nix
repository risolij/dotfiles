{ pkgs, lib, config, ... }:

{
  services.cron = {
    enable = true;
    systemCronJobs = [
      "0 0 * * *    req curl -X GET https://download.dnscrypt.info/blacklists/domains/mybase.txt > /tmp/blacklist.txt"
      "0 */12 * * *  req clamscan -r /home/req > /home/req/logs/output.txt"
    ];
  };
}
