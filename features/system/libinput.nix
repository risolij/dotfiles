{ pkgs, lib, config, ... }:

with lib;

{
  options.nix-services-libinput.enable = mkOption {
    type = types.bool;
    default = false;
    description = "Enable libinput";
  };

  config = mkIf config.nix-services-libinput.enable {
    services.libinput.enable = true;
  };
}
