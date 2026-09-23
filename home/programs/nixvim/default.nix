{ pkgs, inputs, ... }:
{
    programs.nixvim = {
        enable = true;
        nixpkgs.source = inputs.nixpkgs;
        globals.mapleader = " ";
        opts = {
            scrolloff = 999;
            number = true;
            relativenumber = true;
            shiftwidth = 4;
            softtabstop = 4;
            tabstop = 4;
            expandtab = true;
            clipboard = "unnamedplus";
        };

        plugins = {
            lsp = {
	            enable = true;
	            inlayHints = true;
            };
            indent-blankline = {
	            enable = true;
	            settings = {
	                indent = {
	                    char = "┃";
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

                keymaps = {
                    "<leader>f" = "find_files";
                    "<leader>k" = "keymaps";
                };
            };
            rustaceanvim.enable = true;
        };
    };
}
