{ config, lib, pkgs, ... }:
{
  users = {
    users.req = {
      isNormalUser = true;
      extraGroups = ["audio" "wheel" "networkmanager" "kvm" "libvirtd"]; ## [ docker plugdev ]
    };

    groups.plugsdev = {};
  };
}

