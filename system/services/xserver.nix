{ pkgs, lib, config, ... }:

{
  services.xserver = {
    enable = true;
    layout = "us";
    libinput.enable = true;
    
    windowManager.xmonad = {
      enable = true;
      enableContribAndExtras = true;
    };

    displayManager.sddm = {
      enable = true;
      theme = "elarun";
    };
  };
}
