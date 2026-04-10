{ pkgs, ... }:

{
  programs.git = {
    enable = true;
    settings.user = {
      name = "risolij";
      email = "risolij@gmail.com";
    };
    signing = {
      key = "~/.ssh/id_ed25519.pub";
      signByDefault = true;
      format = "ssh";
    };
  };
}
