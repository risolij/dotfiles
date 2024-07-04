{ pkgs, lib, config, ... }:

{
 services.cockpit = {
    enable = true;
    port = 9090;
    settings = {
      Session = {
        IdleTimeout=15;
      };
    };
  };
}
