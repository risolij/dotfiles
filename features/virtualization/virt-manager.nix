{ pkgs, lib, config, ... }:

with lib;

{
  options.nix-programs-virt-manager.enable = mkOption {
    type = types.bool;
    default = false;
    description = "Install virt-manager";
  };

  config = mkIf config.nix-programs-virt-manager.enable {
    programs.virt-manager.enable = true;
  };
}
