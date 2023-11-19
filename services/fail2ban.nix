{ pkgs, lib, config, ... }:

{
  services.fail2ban = {
    enable = true;
    maxretry = 3;
  };
}
