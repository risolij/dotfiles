{ config, lib, pkgs, ... }:
{
  environment.persistence."/persist" = {
    enable = true;
    hideMounts = true;
    files = [
      "/etc/machine-id"
    ];
    users.req = {
      directories = [
        "Downloads"
        "Music"
        "Pictures"
        "Documents"
        "Videos"
        "VirtualBox VMs"
      ];
    };
  };
}
