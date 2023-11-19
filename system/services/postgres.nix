{ pkgs, lib, config, ... }:

{
  services.postgresql = {
    enable = true;
    package = pkgs.postgresql_16;
    enableTCPIP = true;
    settings = {
      enable_seqscan = "off";
    };
    ensureDatabases = [ "dvd" ];
    ensureUsers = [
      {
        name = "req";
        ensurePermissions."DATABASE dvd" = "ALL PRIVILEGES";
      }
    ];
    initialScript = /home/req/environments/school/dvd.sql;
  };
}
