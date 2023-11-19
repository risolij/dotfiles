{ config, pkgs, ... }:

{
  imports =
    [ 
      ../../services
      ./boot.nix
      ./filesystem.nix
      ./hardware.nix
      ./networking.nix
      ./nix.nix
      ./users.nix
      ./system.nix
    ];

  security = {
    pam.services.sshd.showMotd = true;
    polkit.enable = true;
  };

  environment.systemPackages = with pkgs; [];

  i18n.defaultLocale = "en_US.UTF-8";
  console = {
    font = "Lat2-Terminus16";
    keyMap = "us";
  };

  time.timeZone = "America/Phoenix";
  nixpkgs.config.allowUnfree = true;
  virtualisation.libvirtd.enable = true;

  xdg.portal.enable = true;


  system.userActivationScripts.linktosharedfolder.text = ''
  if [[ ! -h "$HOME/.config/nixpkgs" ]]; then
    ln -s "$HOME/environments/git/dotfiles/home-manager" "$HOME/.config/nixpkgs"
  fi
'';

}
