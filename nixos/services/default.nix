{ config, pkgs, ... }: {
  imports = [
      ./basic.nix
      ./cron.nix
      ./fail2ban.nix
      ./journald.nix
      ./pipewire.nix
      ./greetd.nix
      ./udev.nix
      ./libinput.nix
      ## ./cockpit.nix
      ##./thermald.nix
      ## ./actkbd.nix
  ];
}
