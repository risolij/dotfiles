# disko.nix - Lenovo C940, NixOS, impermanent root, persistent /nix + /persist, zswap
{ config, lib, pkgs, ... }:

let
  disk = "/dev/nvme0n1";
in
{
  disko.targetDisk = disk;

  # Partition layout
  disko.partitions = [
    # EFI system partition
    {
      mountPoint = "/boot";
      size = "512M";
      fsType = "vfat";
      type = "efi";
    }

    # LUKS container for root, /nix, /persist
    {
      mountPoint = "/";
      fsType = "btrfs";
      type = "luks";
      luksName = "cryptroot";
      subvolumes = [
        # Ephemeral root
        {
          name = "@root";
          mountPoint = "/";
          tmpfs = true;
          size = "remaining";
        }

        # Persistent Nix store
        {
          name = "@nix";
          mountPoint = "/nix";
          size = "50G";
        }

        # Persistent configs & selective home
        {
          name = "@persist";
          mountPoint = "/persist";
          size = "50G";
        }
      ];
    }

    # LUKS-encrypted swap partition for zswap
    {
      mountPoint = "swap";
      fsType = "swap";
      type = "luks";
      luksName = "cryptswap";
      size = "8G";
    }
  ];

  # User definition (home mapped to /persist/home)
  disko.users = [
    {
      name = "yourusername";
      uid = 1000;
      home = "/persist/home/yourusername";
      shell = pkgs.zsh;
    }
  ];

  # Enable LUKS for root and swap
  disko.enableLuks = true;
  disko.luks = {
    luksName = "cryptroot";
    device = "/dev/nvme0n1p2";
    preLVM = true;
  };
}

