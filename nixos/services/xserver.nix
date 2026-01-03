{ pkgs, lib, config, ... }:

{
  services = {
    displayManager = {
      sessionPackages = [ pkgs.niri ];
      sddm = {
        package = pkgs.kdePackages.sddm;
        extraPackages = with pkgs; [
          kdePackages.qtsvg
          kdePackages.qtmultimedia
        ];
        enable = true;
        wayland.enable = true;
        theme = "${pkgs.sddm-astronaut}/share/sddm/themes/sddm-astronaut-theme";
      };
    };

    power-profiles-daemon.enable = false;

  };
}
