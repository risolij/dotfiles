{ config, lib, pkgs, ... }:

{
  imports = [ 
      ../../nixos/services
      ../../nixos/programs
      ../../modules
      ./filesystem.nix
      ./boot.nix
      ./hardware.nix
      ./users.nix
      ./networking.nix
      ./security.nix
      ./battery.nix
      ## ./niri.nix
      ./xdg.nix
  ];

  system.stateVersion = "20.09";
}
