{ pkgs, lib, config, ... }:

with lib;

{
  options.nix-services-journald.enable = mkOption {
    type = types.bool;
    default = false;
    description = "Enable journald";
  };

  config = mkIf config.nix-services-journald.enable {
    services.journald = {
      extraConfig = ''
        SystemMaxUse=100M
        Compress=yes
        MaxRetentionSec=1day
      '';
    };
  };
}
