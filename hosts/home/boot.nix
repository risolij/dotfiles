{ config, lib, pkgs, ... }:

{
  boot = {
    initrd = {
      includeDefaultModules = false;
      availableKernelModules = [
        "xhci_pci"
        "nvme"
        "usb_storage"
        "sd_mod"
        "ext4"
        "i8042"
        "vfat"
      ];
    };
    blacklistedKernelModules = [ "iTCO_wdt" ];
    extraModprobeConfig = ''
      options iwlwifi power_save=0
      options iwlmvm power_scheme=1
    '';
    extraModulePackages = [ ];
    kernelModules = [ "kvm-intel" ]; 
    kernelParams = [
      "nowatchdog"
      "nmi_watchdog=0"
      "mmio_stale_data=full"
      "i8042.nopnp"
      "i915.fastboot=1"
      "i915.enable_psr=0"
      "quiet"
      "splash"
    ];
    tmp.cleanOnBoot = true;
    kernelPackages = pkgs.linuxPackagesFor pkgs.linux_latest;
    loader.grub = {
      enable = true;
      efiInstallAsRemovable = true;
      efiSupport = true;
      devices = [ "nodev" ];
    };
  };
}
