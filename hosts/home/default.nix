{ config, lib, pkgs, ... }:

{
  imports = [ 
      ../../modules
      ./filesystem.nix
      ./boot.nix
      ./hardware.nix
      ./users.nix
      ./battery.nix
  ];

  system.stateVersion = "20.09";
}
