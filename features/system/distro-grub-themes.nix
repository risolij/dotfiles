{ pkgs, lib, config, ... }:

with lib;

{
  options.nix-distro-grub-themes.enable = mkOption {
    type = types.bool;
    default = false;
    description = "enable Distro Grub Themes";
  };

  config = mkIf config.nix-distro-grub-themes.enable {
    distro-grub-themes = {
      enable = true;
      theme = "nixos";
    };
  };
}
