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
        naturalScrolling = false;
        tapping = true;
        scrollMethod = "twofinger";
      };
    };

    displayManager.gdm.enable = true;
  };
}
