{ config, pkgs, lib, ... }:

let
  background = "#282a36";
  background-alt = "#282a36"; 
  background-attention = "#181920";
  border = "#282a36";
  current-line = "#44475a";
  selection = "#44475a";
  foreground = "#f8f8f2";
  foreground-alt = "#e0e0e0";
  foreground-attention = "#ffffff";
  comment = "#6272a4";
  cyan = "#8be9fd";
  green = "#50fa7b";
  orange = "#ffb86c";
  pink = "#ff79c6";
  purple = "#bd93f9";
  red = "#ff5555";
  yellow = "#f1fa8c";
in
{
  programs.qutebrowser = {
    enable = true;
    settings = {
      content.private_browsing = true;
      scrolling.bar = "never";
      scrolling.smooth = true;
      tabs.show = "never";
      statusbar.show = "never";
      zoom.default = "150%";
      hints.radius = 10;
      fonts.default_size = "20pt";
      colors = {
        hints = {
          bg = "${background}";
          fg = "${pink}";
          match.fg = "${green}";
        };

        keyhint = {
          bg = "${background}";
          fg = "${purple}";
          suffix.fg = "${selection}";
        };

        tabs = {
          bar.bg = "${selection}";
          even.bg = "${selection}";
          even.fg = "${foreground}";
          indicator.error = "${red}";
          indicator.start = "${orange}";
          indicator.stop = "${green}";
          indicator.system = "none";
          odd.bg = "${selection}";
          odd.fg = "${foreground}";
          selected.even.bg = "${background}";
          selected.even.fg = "${foreground}";
          selected.odd.bg = "${background}";
          selected.odd.fg = "${foreground}";
        };

        messages = {
          error.bg = "${background}";
          error.border = "${background-alt}";
          error.fg = "${red}";
          info.bg = "${background}";
          info.border = "${background-alt}";
          info.fg = "${comment}";
          warning.bg = "${background}";
          warning.border = "${background-alt}";
          warning.fg = "${red}";
        };

        prompts = {
          bg = "${background}";
          fg = "${cyan}";
          selected.bg = "${selection}";
        };

        statusbar = {
          caret.bg = "${background}";
          caret.fg = "${orange}";
          caret.selection.bg = "${background}";
          caret.selection.fg = "${orange}";
          command.bg = "${background}";
          command.fg = "${pink}";
          command.private.bg = "${background}";
          command.private.fg = "${foreground-alt}";
          insert.bg = "${background-attention}";
          insert.fg = "${foreground-attention}";
          normal.bg = "${background}";
          normal.fg = "${foreground}";
          passthrough.bg = "${background}";
          passthrough.fg = "${orange}";
          private.bg = "${background-alt}";
          private.fg = "${foreground-alt}";
          progress.bg = "${background}";
          url.error.fg = "${red}";
          url.fg = "${foreground}";
          url.hover.fg = "${cyan}";
          url.success.http.fg = "${green}";
          url.success.https.fg = "${green}";
          url.warn.fg = "${yellow}";
        };

        ## webpage = {
        ##   ## darkmode.enabled = true;
        ## };

        downloads = {
          bar.bg = "${background}";
          error.bg = "${background}";
          error.fg = "${red}";
          stop.bg = "${background}";
          system.bg = "none";
        };

        completion = {
          category.bg = "${background}";
          category.border.bottom = "${border}";
          category.border.top = "${border}";
          category.fg = "${foreground}";
          even.bg = "${background}";
          odd.bg = "${background-alt}";
          fg = "${foreground}";
          item.selected.bg = "${selection}";
          item.selected.border.bottom = "${selection}";
          item.selected.border.top = "${selection}";
          item.selected.fg = "${foreground}";
          match.fg = "${orange}";
          scrollbar.bg = "${background}";
          scrollbar.fg = "${foreground}";
        };
      };
    };
  };
}
