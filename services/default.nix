{ config, pkgs, ... }: {
  imports = [
      ./actkbd.nix
      ./clamav.nix
      ./cron.nix
      ./fail2ban.nix
      ./journald.nix
      ./pipewire.nix
      ./thermald.nix
      ./xserver.nix
  ];

  services.openssh.enable = true;
  services.fwupd.enable = true;
  services.upower.enable = true;
  services.auto-cpufreq.enable = true;
  services.tlp.enable = true;
  services.udev.extraRules = ''
    ACTION=="add", SUBSYSTEM=="net", NAME=="wlp0s20f3", RUN+="${pkgs.ethtool}/bin/ethtool -K wlp0s20f3 tso off"
  '';
  
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
