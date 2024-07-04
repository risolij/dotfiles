{ config, pkgs, ... }:

{
  services.mako = {
    enable = true;
    defaultTimeout = 4000;
    width = 300;
    height = 200;
    backgroundColor = "#282a36";
    textColor = "#44475a";
    padding = "10";
    borderRadius = 10;
  };
}
