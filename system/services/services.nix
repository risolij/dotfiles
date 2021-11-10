{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./prometheus.nix
      ./node-exporter.nix
      ./grafana.nix
      ./postgres.nix
      ./clamav.nix
    ];

  ## Trezor 
  services.trezord.enable = true;

  ## Enable the OpenSSH daemon.
  services.openssh.enable = true;

  ## Thermald
  services.thermald.enable = true;
  services.upower.enable = true;
  systemd.services.upower.enable = true;

}
