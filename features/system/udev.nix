{ pkgs, lib, config, ... }:

with lib;

{
  options.nix-services-udev.enable = mkOption {
    type = types.bool;
    default = false;
    description = "Enable udev";
  };

  config = mkIf config.nix-services-udev.enable {
    services.udev = {
      enable = true;
      extraRules = ''
        ACTION=="add", SUBSYSTEM=="net", NAME=="wlp0s20f3", RUN+="${pkgs.ethtool}/bin/ethtool -K wlp0s20f3 tso off"
    '';
    };
  };
}

