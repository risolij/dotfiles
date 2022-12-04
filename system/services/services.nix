{ config, pkgs, ... }:

{
  imports =
    [ 
      ./actkbd.nix
      ./clamav.nix
      ./cron.nix
      ./fail2ban.nix
      ./journald.nix
      ./thermald.nix
      ./xserver.nix
    ];

  services.openssh.enable = true;
  services.upower.enable = true;
  services.auto-cpufreq.enable = true;

  #### TLP Won't work
  services.tlp.enable = true;
  systemd.services.NetworkManager-wait-online.enable = false;

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
