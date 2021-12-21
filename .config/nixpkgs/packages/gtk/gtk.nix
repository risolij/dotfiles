{ config, pkgs, lib, ... }:

{
  gtk = {
    enable = true;
    theme = {
      name = "Dracula";
      package = pkgs.dracula-theme;
    };
  };
}
