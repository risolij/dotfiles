{ config, pkgs, ... }:

{
  imports =
    [ 
      ./xserver.nix
      ./actkbd.nix
      ./clamav.nix
      ./cron.nix
      ## ./dnscrypt-proxy2.nix
      ./fail2ban.nix
    ];

  services.openssh.enable = true;
  services.thermald.enable = true;
  services.upower.enable = true;

  ## Extras 
  ##########################################
  ## ./hydra.nix
  ## ./prometheus.nix
  ## ./node-exporter.nix
  ## ./grafana.nix
  ## ./postgres.nix
  ## ./fprintd.nix
  ## ./tlp.nix
  ## services.trezord.enable = true;

}
