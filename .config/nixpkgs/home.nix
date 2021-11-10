{ config, pkgs, lib, ... }:

{
  ## Enable Home Manager
  programs.home-manager.enable = true;

  ## Disable manual manpages
  manual.manpages.enable = false;

  nixpkgs.config = {
    allowUnfree = true;
    packageOverrides = pkgs: {
      nur = import (builtins.fetchTarball "https://github.com/nix-community/NUR/archive/master.tar.gz") {
        inherit pkgs;
      };
    };
  };

  ## Custom Configuration Packages
  imports = [
    ./packages/no_custom.nix
    ./packages/alacritty/alacritty.nix 
    ./packages/neovim/neovim.nix
    ./packages/git/git.nix
    ./packages/bash/bash.nix
    ./packages/rofi/rofi.nix
    ./packages/xmonad/xmonad.nix
    ./packages/xmonad/xmobar.nix
    ./packages/picom/picom.nix
    ./packages/qutebrowser/qutebrowser.nix
    ./packages/mpd/mpd.nix
    ./packages/ncmpcpp/ncmpcpp.nix
    ./packages/texlive/texlive.nix
    ./packages/firefox/firefox.nix
    ./packages/direnv/direnv.nix
  ];
}
