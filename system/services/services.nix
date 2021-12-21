{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./actkbd.nix
      ./dnscrypt-proxy2.nix
      ./cron.nix
      ## ./prometheus.nix
      ## ./node-exporter.nix
      ## ./grafana.nix
      ## ./postgres.nix
      ## ./clamav.nix
      ## ./fprintd.nix
      ## ./tlp.nix
    ];

  ## Trezor 
  ## services.trezord.enable = true;

  ## Enable the OpenSSH daemon.
  services.openssh.enable = true;

  ## Thermald
  services.thermald.enable = true;
  services.upower.enable = true;
  systemd.services.upower.enable = true;

}
