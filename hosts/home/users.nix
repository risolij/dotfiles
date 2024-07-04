{ config, lib, pkgs, ... }:
{
  users = {
    users.req = {
      isNormalUser = true;
      extraGroups = ["audio" "input" "wheel" "networkmanager" "kvm" "libvirtd"]; ## [ docker plugdev ]
    };

    groups.plugsdev = {};
  };
}

