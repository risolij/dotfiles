{ config, pkgs, ... }:

{
  programs.firefox = {
    enable = true;
    extensions = with pkgs.nur.repos.rycee.firefox-addons; [ 
      vimium 
      https-everywhere
      privacy-badger
    ];
    profiles.options = {
      name = "Main";
      id = 0;
      settings = { 
        "browser.startup.homepage" = "https://nixos.org";
      };
      bookmarks = {
        wikipedia = {
          keyword = "wiki";
          url = "https://en.wikipedia.org/wiki/Special:Search?search=%s&go=Go";
        };

        "kernel.org" = {
          url = "https://www.kernel.org";
        };

        "nix package versions" = {
          url = "https://lazamar.co.uk/nix-versions/";
        };

      };
    };
  };
}
