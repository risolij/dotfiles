{ config, pkgs, lib, ... }:

{
  gtk = {
    enable = true;
    font.name = "Terminus SemiBold 14";
    theme = {
      name = "Dracula";
      package = pkgs.dracula-theme;
    };
  };
}
