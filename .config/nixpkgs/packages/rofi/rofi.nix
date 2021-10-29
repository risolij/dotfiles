{ config, lib, pkgs, ... }:

{
  programs.rofi = {
    enable = true;
    theme = ./custom.rasi;
    extraConfig = {
      modi = "drun,ssh,window,filebrowser";
      show-icons = true;
      icon-theme = "Papirus";
    };
  };
}
