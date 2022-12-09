{ config, pkgs, lib, ... }:

{
  gtk = {
    enable = true;
    font.name = "Terminus SemiBold 12";
    theme = {
      name = "Dracula";
      package = pkgs.dracula-theme;
    };
  };
}
