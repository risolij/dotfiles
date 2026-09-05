{ pkgs, lib, config, ... }:

with lib;

{
  options.nix-hardware-ledger.enable = mkOption {
    type = types.bool;
    default = false;
    description = "Enable ledger";
  };

  config = mkIf config.nix-hardware-ledger.enable {
    hardware.ledger.enable = true;
  };
}
