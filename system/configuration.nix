{ config, pkgs, ... }:

{
  imports =
    [ 
      ./boot.nix
      ./nix.nix
      ./hardware-configuration.nix
      ./networking/networking.nix
      ./services/services.nix
    ];

  hardware = {
    cpu.intel.updateMicrocode = true;
    opengl = {
      enable = true;
      driSupport = true;
      extraPackages = with pkgs; [
        intel-media-driver
        vaapiIntel
        vaapiVdpau
        libvdpau-va-gl
      ];
    };
    pulseaudio = {
      enable = true;
      support32Bit = true;
      package = pkgs.pulseaudioFull;
    };
    ledger.enable = true;
  };

  environment.etc."X11/xorg.conf.d/20-intel.conf" = {
    text = ''
      Section "Device"
        Identifier "Intel Graphics"
        Driver "intel"
        Option "TearFree" "true"
      EndSection
      '';
  };

  i18n.defaultLocale = "en_US.UTF-8";
  console = {
    font = "Lat2-Terminus16";
    keyMap = "us";
  };
  
  time.timeZone = "America/Phoenix";
  sound.enable = true;
  programs.dconf.enable = true;
  nixpkgs.config.allowUnfree = true;

 
  system.autoUpgrade = {
    enable = true;
    allowReboot = true;
  };

  users = {
    groups.plugsdev = {};
    users.req = {
      isNormalUser = true;
      extraGroups = [ "audio" "wheel" "plugdev"]; 
    };
  };

  system.stateVersion = "20.09";
}
