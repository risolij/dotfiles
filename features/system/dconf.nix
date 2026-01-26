{ pkgs, lib, config, ... }:

with lib;

{
  options.nix-programs-dconf.enable = mkOption {
    type = types.bool;
    default = false;
    description = "Install dconf";
  };

  config = mkIf config.nix-programs-dconf.enable {
    programs.dconf.enable = true;
  };
}
