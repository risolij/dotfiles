{ pkgs, lib, config, ... }:

{
  services.greetd = {
    enable = true;
    settings = rec {
      initial_session = {
        user = "req";
        command = "${pkgs.hyprland}"/bin/Hyprland;
      };
    };

    default_session = initial_session;
  };
}

