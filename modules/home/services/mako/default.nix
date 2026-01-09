{ config, pkgs, ... }:

{
  services.mako = {
    enable = true;
    settings = {
      padding = "10";
      default-timeout = 4000;
      width = 300;
      height = 200;
      border-radius = 10;
    };
  };
}
