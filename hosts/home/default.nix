{ config, lib, pkgs, ... }:

{
  imports = [ 
      ../../modules/nixos
      ./disko-config.nix
      ./boot.nix
      ./hardware.nix
      ./users.nix
      ./battery.nix
  ];

  system.stateVersion = "20.09";
}
