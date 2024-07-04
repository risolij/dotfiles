{ config, lib, pkgs, ... }:

{
  security = {
    pam.services.sshd.showMotd = true;
    polkit.enable = true;
  };
}
