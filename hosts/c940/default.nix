{ config, lib, pkgs, ... }:

{
  imports = [ 
      ../../modules/nixos/programs
      ./disko-config.nix
      ./boot.nix
      ./hardware.nix
      ./users.nix
      ../../features/system
      ../../features/security
      ../../features/media
      ../../features/powermanagement
      ../../features/networking
      ../../features/virtualization
      ../../features/misc
  ];

  nix-services-fail2ban.enable = true;
  nix-services-dnscrypt-proxy2.enable = false;
  nix-services-pipewire.enable = true;
  nix-services-speechd.enable = true;
  nix-services-upower.enable = true;
  nix-services-power-profiles-daemon.enable = false;
  nix-services-thermald.enable = true;
  nix-services-journald.enable = true;
  nix-services-displayManager.enable = true;
  nix-services-keyd.enable = true;
  nix-services-libinput.enable = true;
  nix-services-udev.enable = true;
  nix-services-openssh.enable = true;
  nix-services-flatpak.enable = true;
  nix-services-fwupd.enable = true;
  nix-services-logind.enable = true;
  nix-hardware-ledger.enable = true;
  nix-distro-grub-themes.enable = true;
  nix-systemd-services-scans.enable = true;
  nix-auto-cpufreq.enable = true;
  nix-polkit.enable = true;
  nix-rtkit.enable = true;
  nix-pam-services-sshd-showMotd.enable  = true;
  nix-nix.enable = true;
  nix-xdg.enable = true;
  nix-locale.enable = true;
  nix-networking.enable = true;
  nix-virtualization.enable = true;

  system.stateVersion = "20.09";
}
