{ pkgs, lib, config, ... }:

{
  services.logind.lidSwitch = "suspend";
  services.flatpak.enable = true;
  services.openssh.enable = true;
  services.fwupd.enable = true;
  services.upower.enable = true;
  services.auto-cpufreq.enable = true;
  services.tlp.enable = true;
}
