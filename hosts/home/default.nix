{ config, lib, pkgs, ... }:

{
  imports = [ 
      ../../services
      ../../modules
      ./filesystem.nix
      ./boot.nix
      ./hardware.nix
      ./users.nix
      ./networking.nix
      ./security.nix
      ./xdg.nix
      ./programs
  ];

  system.stateVersion = "20.09";
}
