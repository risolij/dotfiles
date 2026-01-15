{ pkgs, lib, config, ... }:

with lib;

{
  options.nix-services-displayManager.enable = mkOption {
    type = types.bool;
    default = false;
    description = "Enable Display Manager";
  };

  config = mkIf config.nix-services-displayManager.enable {
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
    };
  };
}
