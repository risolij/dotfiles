{ config, pkgs, lib, ... }:

let
    cfg = config.services.noctalia.wallpaperCarousel;
in {
    options.services.noctalia.wallpaperCarousel = {
    enable = lib.mkEnableOption "Noctalia wallpaperCarousel plugin";

    wallpaperDir = lib.mkOption {
      type = lib.types.path;
      default = "${config.home.homeDirectory}/Pictures/Wallpapers";
      description = "The directory containing the background images for the carousel.";
    };

    blurBackground = lib.mkOption {
      type = lib.types.bool;
      default = true;
      description = "Whether to blur the background while the carousel is open.";
    };

    transitionDuration = lib.mkOption {
      type = lib.types.int;
      default = 300;
      description = "The 3D carousel transition duration in milliseconds.";
    };
    };

    config = lib.mkIf cfg.enable {
    home.file.".local/share/noctalia/plugins/wallpaperCarousel".source = pkgs.fetchFromGitHub {
      owner = "motor-dev";
      repo = "wallpaperCarousel";
      rev = "main";
      sha256 = "sha256-/LoehTfSeeqkgIXw46Ll/PrxeEDhg4RZI5BXib6yEnI=";
    };
    };
}