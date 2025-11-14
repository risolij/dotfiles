{ pkgs, lib, config, ... }:

{
  ## services.logind.lidSwitch = "suspend";
  services.logind.settings.Login.HandleLidSwitch = "suspend";
  services.flatpak.enable = true;
  services.openssh.enable = true;
  services.fwupd.enable = true;
  services.upower.enable = true;
}
