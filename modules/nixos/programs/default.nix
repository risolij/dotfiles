{ config, lib, pkgs, ... }:
{
  imports = [
    ./niri
    ./dconf
    ./virt-manager
  ];
}
