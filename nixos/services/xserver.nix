{ pkgs, lib, config, ... }:

{
  services.displayManager.sddm.enable = true;
  services.displayManager = {
    sessionPackages = [ pkgs.niri ];
  };

  ## services.xserver = {
  ##   enable = true;
  ##   desktopManager.gnome.enable = true;
  ## };

  ## services.power-profiles-daemon.enable = false;
  ## hardware.pulseaudio.enable = false;
}
