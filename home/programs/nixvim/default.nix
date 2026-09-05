{ pkgs, ... }:
{
  programs.nixvim = {
    enable = true;
    colorschemes.tokyonight.enable = true;
    globals.mapleader = " ";

    opts = {
      scrolloff = 999;
      number = true;
      relativenumber = true;
      shiftwidth = 2;
    };

    plugins = {
      lsp = {
	enable = true;
	inlayHints = true;
      };
      inlayHints = true;
      indent-blankline = {
	enable = true;
	settings = {
	  indent = {
	    char = "|";
	  };

	  scope.enabled = true;
	};
      };
      blink-cmp.enable = true;
      lualine.enable = true;
      telescope = {
	enable = true;
	settings = {
	  defaults = {
	    file_ignore_patterns = [
	      "target/"
	      "%.direnv/"
	    ];
	  };
	};
      };
      rustaceanvim.enable = true;
    };
    keymaps = [
      {
        action = "<cmd>Telescope find_files<CR>";
        key = "<leader>f";
      }
      {
        action = "<cmd>ToggleTerm<CR>";
      	key = "<leader>gg";
      }
    ];
  };
}
