{ config, pkgs, ... }: {
  imports = [
      ./basic.nix
      ./fail2ban.nix
      ./journald.nix
      ./pipewire.nix
      ./udev.nix
      ./libinput.nix
      ./ledger.nix
      ./niri.nix
      ./speechd.nix
      ./xserver.nix
      ./thermald.nix
      ./keyd.nix
      ./systemd.nix
      ## ./cron.nix
  ];
}
