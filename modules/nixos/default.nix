{ config, lib, pkgs, ... }:
{
  imports = [
    ./programs
    ./services
    ./nix.nix
    ./system.nix
    ./networking.nix
    ./security.nix
    ./xdg.nix
    ./virtualization.nix
  ];
}

