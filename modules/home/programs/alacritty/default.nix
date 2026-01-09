{ config, pkgs, ... }:

{
  programs.alacritty = {
    enable = true;
    settings = {
      window.padding.x = 15;
      window.padding.y = 15;
    };
  };
}
