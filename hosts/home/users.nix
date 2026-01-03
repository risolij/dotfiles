{ config, lib, pkgs, ... }:
{
  users = {
    users.req = {
      shell = pkgs.nushell;
      isNormalUser = true;
      extraGroups = ["audio" "input" "wheel" "networkmanager" "kvm" "libvirtd"]; ## [ docker plugdev ]
      packages = [ 
        pkgs.brightnessctl
      ];
    };

    groups.plugsdev = {};
  };
}
