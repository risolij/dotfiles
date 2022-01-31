{ pkgs, lib, config, ... }:

{
    services.dnscrypt-proxy2 = {
      enable = true;
      settings = {
        require_dnssec = true;
        require_nolog = true;
        cache = true;
        cache_size = 4096;
        dnscrypt_servers = true;
        server_names = [ "cloudflare" ];
        blocked_names = {
          blocked_names_file = /tmp/blacklist.txt;
          log_file = /home/req/logs/blocked-names.log;
        };
        nx_log = {
          file = /home/req/logs/suspicious_dns.log;
          format = "tsv";
        };
        query_log = {
          file = /home/req/logs/dns_query.log;
          format = "tsv";
        };
      };
    };
}
