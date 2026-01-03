{ config, pkgs, lib, ... }:
{
  imports = [
    ./volly.nix
  ];

  programs.volly.enable = true;

  programs.eww = {
    enable = true;
    configDir = ./testing;
  };
}
