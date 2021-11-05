{ config, pkgs, lib, ... }:

{
  ## Enable Home Manager
  programs.home-manager.enable = true;

  nixpkgs.config.allowUnfree = true;

  ## Disable manual manpages
  manual.manpages.enable = false;

  programs.texlive = {
    enable = true;
    extraPackages = tpkgs: {
      inherit (tpkgs)
        wrapfig
        capt-of
        paralist
        scheme-medium;
    };
  };

  ## Custom Configuration Packages
  imports =  [
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
  ];
}
