{ pkgs, lib, config, ... }:

{
  services.postgresql = {
    enable = true;
    package = pkgs.postgresql_11;
    enableTCPIP = true;
    ensureDatabases = [ "rocket" ];
    ensureUsers = [
      {
        name = "rocket";
        ensurePermissions."DATABASE rocket" = "ALL PRIVILEGES";
      }
    ];
  };
}
