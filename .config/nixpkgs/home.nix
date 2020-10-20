{ config, pkgs, ... }:

{
  ## Enable Home Manager
  programs.home-manager.enable = true;

  home.packages = with pkgs; [
    ## Pretty
    neofetch
    htop

    ## Command Line Tools
    acpi
    file
    scrot
    feh
    tree
    weechat
  ];

  ## Git
  programs.git = {
    enable = true;
    userName = "risolij";
    userEmail = "risolij@gmail.com";
  };

  ## Terminal 
  programs.alacritty = {
    enable = true;
    settings = {
      font.size = 12;
      background_opacity = 0.5;
      colors.primary.background = "#333333";
    };
  };


  ## Firefox
  programs.firefox = {
    enable = true;
    profiles = {
      myprofile = {
        settings = {
          "general.smoothScroll" = false;
        };
      };
    };
  };


  ## Neovim
  programs.neovim = {
    enable = true;
    viAlias = true;
    vimAlias = true;
    extraConfig = ''
      colorscheme slate
      let mapleader = " "
      nnoremap <Leader>e :e
      nnoremap <Leader>bp :bp<CR>
      nnoremap <Leader>bd :bd<CR>
      

      nnoremap <Leader>wq :wq<CR>
      nnoremap <Leader>w :w<CR>
    '';
    plugins = [
      pkgs.vimPlugins.vim-nix
    ];
  };
}
