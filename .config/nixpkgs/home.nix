{ config, pkgs, ... }:

{
  ## Enable Home Manager
  programs.home-manager.enable = true;

  ## Disable manual manpages
  manual.manpages.enable = false;

  home.packages = with pkgs; [

    ## Command Line Tools
    lsof
    acpi
    feh
    file
    jq
    neofetch
    nmap
    pulsemixer
    scrot
    tree
    unzip
    weechat
    pavucontrol
    bc
    appimage-run
    rustup
  ];

  programs.bash = {
    enable = true;
    initExtra = ''
      set -o vi
      neofetch
    '';
    shellAliases = {
      ll = "ls -al";
    };
  };

  programs.bat = {
    enable = true;
  };

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

      colors.primary = {
        background = "0x282a36";
        foreground = "0xf8f8f2";
      };

      colors.cursor = {
        text    = "0x44475a";
        cursor  =  "0xf8f8f2";
      };

      colors.selection = {
        text        = "0xf8f8f2";
        background  = "0x44475a";
      };

      colors.normal = {
        black   = "0x000000";
        red     = "0xff5555";
        green   = "0x50fa7b";
        yellow  = "0xf1fa8c";
        blue    = "0xbd93f9";
        magenta = "0xff79c6";
        cyan    = "0x8be9fd";
        white   = "0xbfbfbf";
      };

      colors.bright = {
        black   = "0x4d4d4d";
        red     = "0xff6e67";
        green   = "0x5af78e";
        yellow  = "0xf4f99d";
        blue    = "0xcaa9fa";
        magenta = "0xff92d0";
        cyan    = "0x9aedfe";
        white   = "0xe6e6e6";
      };

      colors.dim = {
        black   = "0x14151b";
        red     = "0xff2222";
        green   = "0x1ef956";
        yellow  = "0xebf85b";
        blue    = "0x4d5b86";
        magenta = "0xff46b0";
        cyan    = "0x59dffc";
        white   = "0xe6e6d1";
      };
    };
  };


  ## Firefox
  programs.firefox = {
    enable = true;
  };


  ## Neovim
  programs.neovim = {
    enable = true;
    viAlias = true;
    vimAlias = true;
    extraConfig = ''
      colorscheme slate
      set tabstop=4
      set shiftwidth=4
      set expandtab

      let mapleader = " "
      nnoremap <Leader>e :e
      nnoremap <Leader>bp :bp<CR>
      nnoremap <Leader>bd :bd<CR>
      nnoremap <Leader>wq :wq<CR>
      nnoremap <Leader>w  :w<CR>
      nnoremap <Leader>q  :q<CR>


      function! WinMove(key)
          let t:curwin = winnr()
          exec "wincmd ".a:key
          if (t:curwin == winnr())
              if (match(a:key, '[jk]'))
                  wincmd v
              else
                  wincmd s
              endif
              exec "wincmd ".a:key
          endif
      endfunction

      nnoremap <silent> <C-h> :call WinMove('h')<CR>
      nnoremap <silent> <C-j> :call WinMove('j')<CR>
      nnoremap <silent> <C-k> :call WinMove('k')<CR>
      nnoremap <silent> <C-l> :call WinMove('l')<CR>

    '';
    plugins = with pkgs.vimPlugins; [ vim-nix rust-vim ];

  };
}
