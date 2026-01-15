{ pkgs, lib, config, ... }:

with lib;

{
  options.nix-services-openssh.enable = mkOption {
    type = types.bool;
    default = false;
    description = "Enable SSH";
  };

  config = mkIf config.nix-services-openssh.enable {
    services.openssh.enable = true;
  };
}
