{ config, pkgs, ... }:

{
  imports =
    [ 
      ./boot.nix
      ./filesystem.nix
      ./hardware.nix
      ./networking.nix
      ./nix.nix
      ./services.nix
    ];

  security.pam.services.sshd.showMotd = true;

  environment.systemPackages = with pkgs; [];

  i18n.defaultLocale = "en_US.UTF-8";
  console = {
    font = "Lat2-Terminus16"; keyMap = "us";
  };

  time.timeZone = "America/Phoenix";
  nixpkgs.config.allowUnfree = true;

  system.autoUpgrade = {
    enable = true;
    allowReboot = true;
  };

  users = {
    motd = ''
      ================================================================
      |                                                              |
      |       UNAUTHORIZED ACCESS TO THIS DEVICE IS PROHIBITED       |
      |                                                              |
      ================================================================

      You must have explicit, authorized permission to access or configure this device. Unauthorized attempts and actions to access or use this system may result in civil and/or criminal penalties. All activities performed on this device are logged and monitored. 


    '';
    groups.plugsdev = {};
    users.req = {
      isNormalUser = true;
      extraGroups = [ "audio" "wheel" "networkmanager" "kvm" "libvirtd"]; ## [docker plugdev] 
    };
  };

  virtualisation.libvirtd.enable = true;

  system.stateVersion = "20.09";
}
