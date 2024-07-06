{ config, lib, pkgs, ... }:
{
  users = {
    users.req = {
      isNormalUser = true;
      extraGroups = ["audio" "input" "wheel" "networkmanager" "kvm" "libvirtd"]; ## [ docker plugdev ]
      packages = [ 
        pkgs.wttrbar 
        pkgs.brightnessctl
        pkgs.hyprpicker
      ];
    };

    groups.plugsdev = {};
  };
}

