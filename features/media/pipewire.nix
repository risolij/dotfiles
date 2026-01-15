{ pkgs, lib, config, ... }:

with lib;

{
  options.nix-services-pipewire.enable = mkOption {
    type = types.bool;
    default = false;
    description = "Enable pipewire";
  };

  config = mkIf config.nix-services-pipewire.enable {
    services.pipewire = {
      enable = true;
      audio.enable = true;
      pulse.enable = true;
      alsa = {
        enable = true;
        support32Bit = true;
      };
      jack.enable = true;
    };
  };
}
