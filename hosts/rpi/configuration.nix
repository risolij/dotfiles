{ config, pkgs, lib, ... }:
{
  hardware.enableRedistributableFirmware = true;
  time.timeZone = "America/Phoenix";
  i18n.defaultLocale = "en_US.UTF-8";
  nixpkgs.config.allowUnfree = true;

  boot = {
    cleanTmpDir = true;
    kernelParams = ["cma=256M"];
    kernel.sysctl = { "vm.swappiness" = 0; };
    loader.raspberryPi = {
      enable = true;
      version = 3;
      uboot.enable = true;
      firmwareConfig = ''
        gpu_mem=256
        boot_delay=10
        hdmi_drive=2
      '';
    };
  };

  environment.systemPackages = with pkgs; [
    vim
  ];

  fileSystems = {
    "/boot" = {
      device = "/dev/disk/by-label/FIRMWARE";
      fsType = "vfat";
    };
    "/" = {
      device = "/dev/disk/by-label/NIXOS_SD";
      fsType = "ext4";
    };
  };

  users = {
    users.req = {
      isNormalUser = true;
      extraGroups = ["wheel"];
    };
  };

  networking = {
    hostName = "pi-kube";
    defaultGateway = {
      address = "10.10.10.1";
    };

    nameservers = [
      "10.10.10.244"
    ] ;
  };


  nix.gc = {
    automatic = true;
    options = "--delete-older-than 7d";
  };

  services.openssh = {
    enable = true;
    permitRootLogin = "yes";
  };
}
