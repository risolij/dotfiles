{ config, pkgs, ... }: {
  imports = [
      ./basic.nix
      ./cron.nix
      ./fail2ban.nix
      ./journald.nix
      ./thermald.nix
      ./pipewire.nix
      ./greetd.nix
      ./udev.nix
      ./cockpit.nix
      ## ./actkbd.nix
  ];
}
