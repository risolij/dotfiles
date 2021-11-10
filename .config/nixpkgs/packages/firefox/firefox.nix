{ config, pkgs, ... }:

{
  programs.firefox = {
    enable = true;
    extensions = with pkgs.nur.repos.rycee.firefox-addons; [ 
      vimium 
      https-everywhere
    ];
  };
}
