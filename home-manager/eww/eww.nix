{ config, pkgs, lib, ... }:

{
  programs.eww = {
    enable = true;
    configDir = ./temp;
  };
}
