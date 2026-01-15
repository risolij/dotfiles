{ pkgs, lib, config, ... }:

with lib;

{
  options.nix-services-fail2ban.enable = mkOption {
    type = types.bool;
    default = false;
    description = "Enable Fail2ban";
  };

  config = mkIf config.nix-services-fail2ban.enable {
    services.fail2ban = {
      enable = true;
      maxretry = 3;
    };
  };
}
