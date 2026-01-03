{ pkgs, lib, config, ... }:

{
  services = {
    logind.settings.Login.HandleLidSwitch = "suspend";
    flatpak.enable = true;
    openssh.enable = true;
    fwupd.enable = true;
    upower.enable = true;
    power-profiles-daemon.enable = false;
  };
}
