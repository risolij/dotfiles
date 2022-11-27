{ config, lib, pkgs, ... }:
{
  boot = {
    initrd = {
      kernelModules = [ ];
      availableKernelModules = [ "xhci_pci" "nvme" "usb_storage" "sd_mod" ];
    };
    extraModulePackages = [ ];
    kernelModules = [ "kvm-intel" ]; ## acpi_call
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

