{ config, lib, pkgs, ... }:
{
  nix = {
    package = pkgs.nixUnstable;
    settings.max-jobs = lib.mkDefault 8;
    extraOptions = ''
      experimental-features = nix-command flakes
    '';
    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 30d";
    };
  };
}

