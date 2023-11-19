{ config, pkgs, ... }:

{
  i18n.defaultLocale = "en_US.UTF-8";
  time.timeZone = "America/Phoenix";
  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [];

  console = {
    font = "Lat2-Terminus16";
    keyMap = "us";
  };

  system.userActivationScripts.linktosharedfolder.text = ''
  if [[ ! -h "$HOME/.config/nixpkgs" ]]; then
    ln -s "$HOME/environments/git/dotfiles/home-manager" "$HOME/.config/nixpkgs"
  fi
'';

}
