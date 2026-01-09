{ pkgs, lib, stylix, ... }:
{
  stylix = {
    enable = true;
    targets.gtk.enable = true;

    ## icons = {
    ##   enable = true;
    ##   package = pkgs.numix-icon-theme-square;
    ## };

    cursor = {
      name = "Bibata-Modern-Amber";
      package = pkgs.bibata-cursors;
      size = 32;
    };

    base16Scheme = "${pkgs.base16-schemes}/share/themes/tokyo-night-dark.yaml";
  };
}
