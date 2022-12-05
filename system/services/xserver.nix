{ pkgs, lib, config, ... }:

{
  services.xserver = {
    enable = true;
    layout = "us";

    wacom.enable = true;
    videoDrivers = [ "modesetting" "i915" ];
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

    displayManager = {
      defaultSession = "none+xmonad";
      lightdm = {
        enable = true;
        greeters.pantheon.enable = true;
      };
    };
  };
}
