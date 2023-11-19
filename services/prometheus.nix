{ config, lib, pkgs, ... }:

{
  ## Open Firewall
  networking.firewall.allowedTCPPorts = [ 9090 ];

  ## Prometheus
  services.prometheus = {
    enable = true;
    scrapeConfigs = [
        {
            job_name = "prometheus";
            scrape_interval = "10s";
            static_configs = [
                {
                    targets = [
                        "localhost:9090"
                        "localhost:9100"
                    ];
                }
            ];
        }
    ];
  };
}
