{ pkgs, lib, config, ... }:

{
  services.xserver = {
    enable = true;
    layout = "us";

    wacom = {
      enable = true;
    };

    exportConfiguration = true;

    libinput = {
      enable = true;
      touchpad = {
        accelProfile = "adaptive";
        naturalScrolling = true;
        tapping = true;
        scrollMethod = "twofinger";
      };
    };

    windowManager.xmonad = {
      enable = true;
      enableContribAndExtras = true;
    };

    displayManager.lightdm = {
      enable = true;
      greeters.pantheon = {
        enable = true;
      };
    };
  };
}
