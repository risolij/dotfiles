{ pkgs, ... }:
{
    boot = {
        initrd = {
            systemd = {
                enable = true;
                ## tpm2.enable = true;
            };
            includeDefaultModules = false;
            availableKernelModules = [
                "nvme"
                "xhci_pci"
                "sd_mod"
                "atkbd"
                "i8042"
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
          "i915"
          "typec_ucsi"
          "typec_displayport"
          "ucsi_acpi"
        ];
        kernelParams = [
            "8250.nr_uarts=0"
            "nowatchdog"
            "nmi_watchdog=0"
            "quiet"
            "intel_pstate=active"
            "i8042.nopnp=1"
            "i8042.noaux=1"
            "zswap.enabled=1"
            "zswap.compressor=zstd"
            "zswap.zpool=zsmalloc"
            "zswap.shrinker_enabled=1"
            "zswap.max_pool_percent=50"
            "pci=realloc"
        ];
        tmp.cleanOnBoot = true;
        kernelPackages = pkgs.linuxPackagesFor pkgs.linux_latest;
        loader.grub = {
            enable = true;
            efiInstallAsRemovable = true;
            efiSupport = true;
            devices = [ "nodev" ];
        };

        ## binfmt.emulatedSystems = [ "aarch64-linux" ];
    };
}
