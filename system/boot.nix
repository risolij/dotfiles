{ config, lib, pkgs, ... }:
{
  boot = {
    kernelParams = [
      "intel_iommu=off" 
      "fastboot=1"
      "nuclear_pageflip=1"
    ];
    kernelPackages = pkgs.linuxPackagesFor pkgs.linux_latest;
    loader.grub = {
      enable = true;
      efiInstallAsRemovable = true;
      efiSupport = true;
      devices = [ "nodev" ];
    };
  };
}

