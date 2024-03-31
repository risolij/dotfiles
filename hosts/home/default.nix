{ config, lib, pkgs, ... }:

{
  imports = [ 
      ../../services
      ../../modules/system.nix
      ../../modules/nix.nix
      ./filesystem.nix
  ];

  networking.networkmanager.enable = true;
  systemd.services.NetworkManager-wait-online.enable = false;
  security = {
    pam.services.sshd.showMotd = true;
    polkit.enable = true;
  };

  xdg.portal = { 
    enable = true; 
    config = {
      common = {
        default = [ "gtk" ];
      };
    };
    ## extraPortals = [ pkgs.xdg-desktop-portal-gtk ]; 
  };

  users = {
    users.req = {
      isNormalUser = true;
      extraGroups = ["audio" "wheel" "networkmanager" "kvm" "libvirtd"]; ## [ docker plugdev ]
    };

    groups.plugsdev = {};
    motd = ''
      ================================================================
      |                                                              |
      |       UNAUTHORIZED ACCESS TO THIS DEVICE IS PROHIBITED       |
      |                                                              |
      ================================================================

      You must have explicit, authorized permission to access or configure this device. Unauthorized attempts and actions to access or use this system may result in civil and/or criminal penalties. All activities performed on this device are logged and monitored. 


    '';
  };

  hardware = {
    cpu.intel.updateMicrocode = true;
    enableRedistributableFirmware = true;

    opengl = {
      enable = true;
      driSupport = true;
      extraPackages = with pkgs; [
        intel-media-driver
        vaapiIntel
        vaapiVdpau
        libvdpau-va-gl
      ];
    };

    pulseaudio = {
      enable = true;
      support32Bit = true;
      package = pkgs.pulseaudioFull;
    };

    sensor.iio.enable = true;
  };

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

  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";

  system.stateVersion = "20.09";
}
