{ config, lib, pkgs, ... }:
with lib;

let 
  cfg = config.programs.volly;
in
{
  options.programs.volly = {
    enable = mkEnableOption "volly";
  };

  ## config = mkIf cfg.enable {
  ##   home.file."${config.xdg.configHome}/eww/volly.nu".source = ./testing/scripts/volly.nu;
  ## };
}

