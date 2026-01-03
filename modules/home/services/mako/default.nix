{ config, pkgs, ... }:

{
  services.mako = {
    enable = true;
    settings = {
      padding = "10";
      default-timeout = 4000;
      width = 300;
      height = 200;
      background-color = "#282a36";
      text-color = "#44475a";
      border-radius = 10;
    };
  };
}
