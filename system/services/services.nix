{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./actkbd.nix
      ./clamav.nix
      ./cron.nix
      ./dnscrypt-proxy2.nix
      ## ./hydra.nix
      ## ./prometheus.nix
      ## ./node-exporter.nix
      ## ./grafana.nix
      ## ./postgres.nix
      ## ./fprintd.nix
      ## ./tlp.nix
    ];

  ## Trezor 
  ## services.trezord.enable = true;

  ## Enable the OpenSSH daemon.
  services.openssh.enable = true;

  ## Thermald
  services.thermald.enable = true;

  ## upower
  services.upower.enable = true;
}
