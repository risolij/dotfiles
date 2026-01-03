{ config, lib, pkgs, ... }:

{
  security = {
    rtkit.enable = true;
    polkit.enable = true;
    pam.services.sshd.showMotd = true;
  };
}
