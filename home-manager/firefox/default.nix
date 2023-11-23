{ config, pkgs, ... }:

{
  programs.firefox = {
    enable = true;

    profiles = {
      default = {
        isDefault = true;
        settings = { 
          "beacon.enabled" = false;
          "browser.contentblock.category" = "strict";
          "browser.preferences.defaultPerformanceSettings.enabled" = false;
          "browser.privatebrowsing.autostart" = true;
          "browser.security.https_only_mode" = true;
          "browser.startup.homepage" = "https://nixos.org";
          "browser.startup.page" = 3;
          "browser.uidensity" = 3;
          "browser.urlbar.placeholderName" = "DuckDuckGo";
          "dom.battery.enabled" = false;
          "geo.enabled" = false;
          "mousewheel.default.delta_multiplier_y" = 15;
          "mousewheel.default.delta_multiplier_x" = 15;
          "places.history.enabled" = false;
          "privacy.donottrackheader.enabled" = true;
          "privacy.donottrackheader.value" = 1;
          "browser.display.os-zoom-behavior" = 0;
        };
        bookmarks = {
          wikipedia = {
            name = "wiki";
            keyword = "wiki";
            url = "https://en.wikipedia.org/wiki/Special:Search?search=%s&go=Go";
          };

          kernel = {
            name = "kernel";
            url = "https://www.kernel.org";
          };

          nix-versions = {
            name = "nix versions";
            url = "https://lazamar.co.uk/nix-versions/";
          };

          pihole-dns = {
            name = "pi-hole configurations";
            url = "https://discourse.pi-hole.net/t/how-do-i-configure-my-devices-to-use-pi-hole-as-their-dns-server/245";
          };

          wolfram = {
            name = "wolfram";
            url = "https://www.wolframalpha.com/";
          };

          books = {
            name = "books";
            url = "https://brytewave.redshelf.com/";
          };

          firefox-options = {
            name = "firefox options";
            url = "https://gitlab.com/rycee/configurations/-/blob/master/user/firefox.nix";
          };

          i915 = {
            name = "i915";
            url = "https://wiki.archlinux.org/title/Intel_graphics#Screen_flickering";
          };

          i915nix = {
            name = "i915nix";
            url = "https://nixos.org/manual/nixos/stable/index.html#sec-x11--graphics-cards-intel";
          };

          waybar = {
            name = "waybar";
            url = "https://github.com/Ruixi-rebirth/nixos-config/blob/main/modules/programs/waybar/hyprland_waybar.nix";
          };
        };
      };
    };
  };
}
