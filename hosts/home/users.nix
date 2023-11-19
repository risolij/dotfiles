{ config, lib, pkgs, ... }:

{
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
}

