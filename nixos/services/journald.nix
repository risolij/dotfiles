{ pkgs, lib, config, ... }:

{
  services.journald = {
    extraConfig = ''
      SystemMaxUse=100M
      Compress=yes
      MaxRetentionSec=1day
    '';
  };
}
