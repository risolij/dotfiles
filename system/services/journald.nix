{ pkgs, lib, config, ... }:

{
  services.journald = {
    extraConfig = ''
      SystemMaxUse=100M
      MaxRetentionSec=1day
    '';
  };
}
