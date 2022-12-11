{ config, pkgs, ... }:

{
  programs.alacritty = {
    enable = true;
    settings = {
      window.padding.x = 15;
      window.padding.y = 15;
      font.size = 16;

      colors.primary = {
        background = "0x2E3440";
        foreground = "0x5E81AC";
      };

      colors.cursor = {
        text    = "0x88C0D0";
        cursor  =  "0xf8f8f2";
      };

      colors.selection = {
        text        = "0xf8f8f2";
        background  = "0x44475a";
      };

      colors.normal = {
        black   = "0x3B4252";
        red     = "0xBF616A";
        green   = "0xA3BE8C";
        yellow  = "0xEBCB8B";
        blue    = "0x81A1C1";
        magenta = "0xB48EAD";
        cyan    = "0x88C0D0";
        white   = "0xE5E9F0";
      };

      colors.bright = {
        black   = "0x4C566A";
        red     = "0xBF616A";
        green   = "0xA3BE8C";
        yellow  = "0xEBCB8B";
        blue    = "0x81A1C1";
        magenta = "0xB48EAD";
        cyan    = "0x8FBCBB";
        white   = "0xECEFF4";
      };

      colors.dim = {
        black   = "0x3B4252";
        red     = "0xBF616A";
        green   = "0xA3BE8C";
        yellow  = "0xEBCB8B";
        blue    = "0x81A1C1";
        magenta = "0xB48EAD";
        cyan    = "0x88C0D0";
        white   = "0xE5E9F0";
      };
    };
  };
}

