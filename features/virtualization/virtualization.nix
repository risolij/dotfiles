{ config, lib, pkgs, ... }:

with lib;

{
  options.nix-virtualization.enable = mkOption {
    type = types.bool;
    default = false;
    description = "Enable Virtualization Services";
  };

  config = mkIf config.nix-virtualization.enable {
    virtualisation.libvirtd.enable = true;
    virtualisation.spiceUSBRedirection.enable = true;
  };
}
