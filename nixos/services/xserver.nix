{ pkgs, lib, config, ... }:

{
  services.displayManager = {
    sessionPackages = [ pkgs.hyprland ];
  };

  services.xserver = {
    enable = true;
    desktopManager.gnome.enable = true;
  };

  services.power-profiles-daemon.enable = false;
  hardware.pulseaudio.enable = false;
}
