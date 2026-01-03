{ config, pkgs, ... }:

{
  programs.git = {
    enable = true;
    settings.user = {
      name = "risolij";
      email = "risolij@gmail.com";
    };
  };
}
