{ pkgs, lib, config, ... }:

{
    services.grafana = {
        enable = true;
        port = 3000;
        protocol = "http";
        dataDir = "/var/lib/grafana";
    };
}
