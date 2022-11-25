{ config, pkgs, ... }:

{
  imports =
    [ 
      ./xserver.nix
      ./actkbd.nix
      ./clamav.nix
      ./cron.nix
      ./fail2ban.nix
      ./journald.nix
    ];

  services.openssh.enable = true;
  services.thermald.enable = true;
  services.upower.enable = true;
  services.auto-cpufreq.enable = true;
  services.tlp.enable = true;

  ## Extras 
  ########################################## # 
  ## ./hydra.nix
  ## ./prometheus.nix
  ## ./node-exporter.nix
  ## ./grafana.nix
  ## ./postgres.nix
  ## ./fprintd.nix
  ## ./dnscrypt-proxy2.nix
  ## services.trezord.enable = true;
}
