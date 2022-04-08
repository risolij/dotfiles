{ pkgs, lib, config, ... }:

{
  services.xserver = {
    enable = true;
    layout = "us";
    libinput = {
      enable = true;
      touchpad = {
        accelProfile = "adaptive";
        naturalScrolling = true;
      };
    };
    
    ## windowManager.exwm = {
    ##   enable = false;
    ##   loadScript = ''
    ##     (require 'exwm)
    ##     (exwm-enable)
    ##   '';
    ##   enableDefaultConfig = true;
    ## };

    windowManager.xmonad = {
      enable = true;
      enableContribAndExtras = true;
    };

    displayManager.lightdm = {
      enable = true;
      greeters.enso = {
        enable = true;
      };
    };
  };
}
