{ pkgs, lib, config, ... }:

{
  services.displayManager = {
    sessionPackages = [ pkgs.hyprland ];
  };

  services.xserver = {
    enable = true;
  };
}
