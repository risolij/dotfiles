{ config, pkgs, ... }:

{
  programs.git = {
    enable = true;
    userName = "risolij";
    userEmail = "risolij@gmail.com";
  };
}
