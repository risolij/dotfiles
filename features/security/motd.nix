{ config, lib, pkgs, ... }:

with lib;

{
  options.nix-pam-services-sshd-showMotd.enable = mkOption {
    type = types.bool;
    default = false;
    description = "Enable sshd motd";
  };

  config = mkIf config.nix-pam-services-sshd-showMotd.enable {
    security.pam.services.sshd.showMotd = true;
  };
}
