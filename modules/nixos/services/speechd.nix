{ pkgs, lib, config, ... }:

{
  services.speechd = {
    enable = true;
    package = pkgs.espeak-ng;
  };
}
