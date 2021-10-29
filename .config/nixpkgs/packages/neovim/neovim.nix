{ config, pkgs, ... }:
{
  programs.neovim = {
    enable = true;
    viAlias = true;
    vimAlias = true;
    extraConfig = ''
      colorscheme default
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
