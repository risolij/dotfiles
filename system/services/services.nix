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
  ## system.activationScripts = {
  ##   rfkillUnblockWlan = {
  ##     text = ''
  ##     rfkill unblock wlan
  ##     '';
  ##     deps = [];
  ##   };
  ## };
  ## systemd.services.network-addresses-wlp0s20f3.requires = [ "tlp.service" ];
  ## systemd.services.network-addresses-wlp0s20f3.after = [ "tlp.service" ];

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
