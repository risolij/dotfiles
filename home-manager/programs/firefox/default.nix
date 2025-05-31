{ config, pkgs, lib, ... }:

{
  programs.firefox = {
    enable = true;

    policies = {
      DisableTelemetry = true;
      DisableFirefoxStudies = true;
      DisablePocket = true;
      DontCheckDefaultBrowser = true;
      EnableTrackingProtection = {
        Value = true;
        Locked = true;
        Cryptomining = true;
        Fingerprinting = true;
      };
      ExtensionSettings = {
        "*".installation_mode = "blocked";
        "uBlock0@raymondhill.net" = {
          install_url = "https://addons.mozilla.org/firefox/downloads/latest/ublock-origin/latest.xpi";
          installation_mode = "force_installed";
        };
        "jid1-MnnxcxisBPnSXQ@jetpack" = {
          install_url = "https://addons.mozilla.org/firefox/downloads/latest/privacy-badger17/latest.xpi";
          installation_mode = "force_installed";
        };
      };
    };


    profiles = {
      default = {
        isDefault = true;
        settings = { 
          "beacon.enabled" = false;
          "browser.contentblocking.category" = "strict";
          "browser.preferences.defaultPerformanceSettings.enabled" = false;
          "browser.privatebrowsing.autostart" = false;
          "browser.security.https_only_mode" = true;
          "browser.startup.homepage" = "https://nixos.org";
          "browser.startup.page" = 3;
          "browser.uidensity" = 3;
          "browser.urlbar.placeholderName" = "DuckDuckGo";
          "dom.battery.enabled" = false;
          "geo.enabled" = false;
          "mousewheel.default.delta_multiplier_y" = 15;
          "mousewheel.default.delta_multiplier_x" = 15;
          "places.history.enabled" = true;
          "privacy.donottrackheader.enabled" = true;
          "privacy.donottrackheader.value" = 1;
          "browser.display.os-zoom-behavior" = 0;
        };
        bookmarks = {
          force = true;
          settings = [
            {
              name = "wiki";
              keyword = "wiki";
              url = "https://en.wikipedia.org/wiki/Special:Search?search=%s&go=Go";
            }
            {
              name = "kernel";
              url = "https://www.kernel.org";
            }
            {
              name = "nix versions";
              url = "https://lazamar.co.uk/nix-versions/";
            }
            {
              name = "pi-hole configurations";
              url = "https://discourse.pi-hole.net/t/how-do-i-configure-my-devices-to-use-pi-hole-as-their-dns-server/245";
            }
            {
              name = "wolfram";
              url = "https://www.wolframalpha.com/";
            }
            {
              name = "firefox options";
              url = "https://gitlab.com/rycee/configurations/-/blob/master/user/firefox.nix";
            }
            {
              name = "NixOS & Flakes Book";
              url = "https://nixos-and-flakes.thiscute.world/";
            }
            {
              name = "Noogle";
              url = "https://nixos-and-flakes.thiscute.world/";
            }
          ];
        };
      };
    };
  };
}
