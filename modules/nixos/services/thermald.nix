{ pkgs, lib, config, ... }:

{
  services.thermald = {
    enable = true;
  };
}

