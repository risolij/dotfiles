{ config, pkgs, ... }: {
  imports = [
      ./basic.nix
      ./cron.nix
      ./fail2ban.nix
      ./journald.nix
      ./pipewire.nix
      ./udev.nix
      ./libinput.nix
      ./ledger.nix
      ./niri.nix
      ./xserver.nix
  ];
}
