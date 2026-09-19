{ pkgs, ... }:
{
  boot = {
    initrd = {
      includeDefaultModules = true;
      availableKernelModules = [
        "nvme"
        "xhci_pci"
        "ahci"
        "usbhid"
        "sd_mod"
      ];
    };
    blacklistedKernelModules = [
      "floppy"
      "pcspkr"
      "joydev"
      "iTCO_wdt"
    ];
    extraModprobeConfig = ''
      options iwlwifi power_save=1
      options iwlmvm power_scheme=2
      options snd slots=sof-hda-dsp
      options snd_hda_intel power_save=1 power_save_controller=Y
    '';
    extraModulePackages = [ ];
    kernelModules = [
      "kvm-intel"
      "thunderbolt"
    ];
    kernelParams = [
      "nowatchdog"
      "nmi_watchdog=0"
      "quiet"
      "intel_pstate=active"
      "i2c_hid.polling_mode=1"
      "i8042.nopnp=1"
      "i8042.noaux=1"
      "zswap.enabled=1"
      "zswap.compressor=zstd"
      "zswap.zpool=zsmalloc"
      "zswap.shrinker_enabled=1"
      "zswap.max_pool_percent=50"
    ];
    tmp.cleanOnBoot = true;
    kernelPackages = pkgs.linuxPackagesFor pkgs.linux_latest;
    loader.grub = {
      enable = true;
      efiInstallAsRemovable = true;
      efiSupport = true;
      devices = [ "nodev" ];
    };

    ## binfmt.emulatedSystems = [ "armv7l-linux" ]; ##"aarch64-linux" " ];
  };
}
