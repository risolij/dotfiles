{ pkgs, lib, config, ... }:

{
    services.dnscrypt-proxy2 = {
      enable = true;
      settings = {
        require_dnssec = true;
        cache = true;
        cache_size = 4096;
        dnscrypt_servers = true;
        server_names = [ "cloudflare" "google" ];
        blocked_names = {
          blocked_names_file = /tmp/blacklist.txt;
          #log_file = /tmp/blocked-names.log;
        };
      };
    };
}
