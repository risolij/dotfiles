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
        "{d7742d87-e61d-4b78-b8a1-b469842139fa}" = {
          install_url = "https://addons.mozilla.org/firefox/downloads/file/4458679/vimium_ff-2.2.1.xpi";
          installation_mode = "force_installed";
        };
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
        extensions.force = true;
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
          "places.history.enabled" = true;
          "privacy.donottrackheader.enabled" = true;
          "privacy.donottrackheader.value" = 1;
          "browser.display.os-zoom-behavior" = 0;
          "gfx.webrender.all" = true;
          "gfx.webrender.compositor" = true;
          "gfx.webrender.compositor.force-enabled" = true;
          "media.ffmpeg.vaapi.enabled" = true;
          "media.hardware-video-decoding.force-enabled" = true;
          "media.hardware-video-encoding.force-enabled" = true;
          ## "general.smoothScroll" = true;
          ## "general.smoothScroll.currentVelocityWeighting" = 1;
          ## "general.smoothScroll.msdPhysics.continuousMotionMaxDeltaMS" = 12;
          ## "general.smoothScroll.msdPhysics.enabled" = true;
          ## "general.smoothScroll.msdPhysics.motionBeginSpringConstant" = 600;
          ## "general.smoothScroll.msdPhysics.regularSpringConstant" = 250;
          ## "general.smoothScroll.msdPhysics.slowdownMinDeltaMS" = 25;
          ## "general.smoothScroll.msdPhysics.slowdownMinDeltaRatio" = 0.3;
          ## "general.smoothScroll.msdPhysics.slowdownSpringConstant" = 250;
          ## "general.smoothScroll.stopDecelerationWeighting" = 1.0;
          ## "mousewheel.default.delta_multiplier_y" = 50;
          ## "mousewheel.default.delta_multiplier_x" = 15;
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
