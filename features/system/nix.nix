{ lib, pkgs, config, ... }:

with lib;

{
  options.nix-nix.enable = mkOption {
    type = types.bool;
    default = false;
    description = "Enable Default Nix Settings";
  };

  config = mkIf config.nix-nix.enable {
    nixpkgs.overlays = [
      (final: prev: {
        libdisplay-info_0_2 = prev.libdisplay-info_0_3 or prev.libdisplay-info;
      })
    ];

    nix = {
      package = pkgs.nixVersions.latest;

      settings = {
        max-jobs = lib.mkDefault 8;
        auto-optimise-store = true;
        experimental-features = [ "nix-command" "flakes" ];
      };

      gc = {
        automatic = true;
        dates = "weekly";
        options = "--delete-older-than 30d";
      };
    };
  };
}
