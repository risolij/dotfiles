{ config, lib, pkgs, ... }:
{
  imports = [
    ./niri
    ./dconf
  ];
}
