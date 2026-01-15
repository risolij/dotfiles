{ ... }:
{
  imports = [
    ./cpufreq.nix
    ./distro-grub-themes.nix
    ./xserver.nix
    ./nix.nix
    ./xdg.nix
    ./locale.nix
    ./journald.nix
    ./udev.nix
    ./libinput.nix
    ./keyd.nix
    ./fwupd.nix
    ./logind.nix
  ];
}
