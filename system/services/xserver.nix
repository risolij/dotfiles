{ pkgs, lib, config, ... }:

{
  ## Docker configuration
  ## virtualisation.docker.enable = true;

  services.xserver = {
    enable = true;
    layout = "us";
    wacom = {
      enable = true;
    };
    libinput = {
      enable = true;
      touchpad = {
        accelProfile = "adaptive";
        naturalScrolling = true;
        tapping = true;
        additionalOptions = "Option \"Tapping\" \"on\"\n";
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
