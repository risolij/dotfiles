{ ... }:
{
    imports = [
        ./distro-grub-themes.nix
        ./displaymanager.nix
        ./nix.nix
        ./xdg.nix
        ./locale.nix
        ./journald.nix
        ./udev.nix
        ./keyd.nix
        ./fwupd.nix
        ./logind.nix
        ./dconf.nix
    ];
}
