{ pkgs, lib, config, ... }:

{
  services.greetd = {
    enable = true;
    settings = rec {
      command = Hyprland;
      user = "req";
    };
    default_session = initial_session;

  };
}

