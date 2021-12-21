{ pkgs, lib, config, ... }:

{
  services.notify-osd = {
    enable = true;
  };
}
