{ pkgs, lib, config, ... }:

with lib;

{
    options.nix-programs-localsend.enable = mkOption {
        type = types.bool;
        default = false;
        description = "Enable LocalSend";
    };

    config = mkIf config.nix-programs-localsend.enable {
        programs.localsend = {
            enable = true;
            openFirewall = true;
        };
    };
}
