{ config, pkgs, ... }:

{
  imports =
    [ 
      ./services/actkbd.nix
      ./services/clamav.nix
      ./services/cron.nix
      ./services/fail2ban.nix
      ./services/journald.nix
      ./services/thermald.nix
      ./services/xserver.nix
    ];

  services.openssh.enable = true;
  services.upower.enable = true;
  services.auto-cpufreq.enable = true;
  services.tlp.enable = true;
  systemd.services.NetworkManager-wait-online.enable = false;

  ## Extras 
  ########################################## # 
  ## ./services/hydra.nix
  ## ./services/prometheus.nix
  ## ./services/node-exporter.nix
  ## ./services/grafana.nix
  ## ./services/postgres.nix
  ## ./services/fprintd.nix
  ## ./services/dnscrypt-proxy2.nix
  ## services.trezord.enable = true;
}
