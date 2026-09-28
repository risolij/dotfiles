{ config, pkgs, lib, ... }:

{
  networking.hostName = "pihole";

  networking.networkmanager.enable = true;
  users.users.pi = {
    isNormalUser = true;
    extraGroups = [ "wheel" "networkmanager" ];
    openssh.authorizedKeys.keys = [
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIBLQj3PaFKm9Aq0D94ANZ8FuB6JsSG96wqLZZJedipuj" 
    ];
  };

  boot.loader.grub.enable = lib.mkForce false;
  boot.loader.generic-extlinux-compatible.enable = true;

  hardware.enableRedistributableFirmware = true;
  nix.settings.auto-optimize-store = true;
  time.timeZone = "UTC";
  swapDevices = [ { device = "/swapfile"; size = 2048; } ];

  services = {
    openssh = {
        enable = true;
        settings.PermitRootLogin = "prohibit-password";
    };

    pihole-ftl = {
        enable = true;
        openFirewallDNS = true;
        openFirewallWebserver = true;

        lists = [
            {
                url = "https://raw.githubusercontent.com/StevenBlack/hosts/master/hosts";
                type = "block";
                enabled = true;
                description = "Steven Black's Default Ad + Malware List";
            }
        ];

        settings = {
            dns.upstreams = [ "9.9.9.9" "1.1.1.1" ];
        };
    };
    pihole-web = {
        enable = true;
        ports = [ "80r" "443s" ];
    };
  };

  security.sudo.wheelNeedsPassword = false;

  system.stateVersion = "24.11";
}
