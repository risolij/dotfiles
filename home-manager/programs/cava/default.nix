{ config, pkgs, ... }:

{
  programs.cava = {
    enable = true;
    color = {
      background = "'#000000'";
      foreground = "'#FFFFFF'";

  };
}
