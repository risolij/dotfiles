{ config, lib, pkgs, ... }:
{
  imports = [
    ./programs
    ./services
    ./nix.nix
    ./system.nix
    ./networking.nix
    ./security.nix
    ./virtualization.nix
    ./xdg.nix
    ./distro-grub-themes.nix
  ];
}
