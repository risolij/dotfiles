{ config, lib, pkgs, ... }:
{
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
}
