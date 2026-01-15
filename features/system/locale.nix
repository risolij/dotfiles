{ config, pkgs, lib, ... }:

with lib;

{
  options.nix-locale.enable = mkOption {
    type = types.bool;
    default = false;
    description = "Enable local options";
  };

  config = mkIf config.nix-locale.enable {
    i18n.defaultLocale = "en_US.UTF-8";
    time.timeZone = "America/Phoenix";

    nixpkgs = {
      hostPlatform = lib.mkDefault "x86_64-linux";
      config.allowUnfree = true;
    };

    console = {
      font = "Lat2-Terminus16";
      keyMap = "us";
    };
  };
}
