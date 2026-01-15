{ pkgs, lib, config, ... }:

with lib;

{
  options.nix-auto-cpufreq.enable = mkOption {
    type = types.bool;
    default = false;
    description = "Enable auto-cpufreq";
  };

  config = mkIf config.nix-auto-cpufreq.enable {
    services.auto-cpufreq = {
      enable = true;
      settings = {
        charger = {
          governor = "performance";
          turbo = "auto";
        };
      
        battery = {
          governor = "powersave";
          turbo = "auto";
        };
      };
    };
  };
}
