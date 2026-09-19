{
  description = "System Configuration";

  inputs = {
    nixpkgs = {
      url = "nixpkgs/nixos-unstable";
    };

    nixos-hardware = {
      url = "github:NixOs/nixos-hardware/master";
    };

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    niri = {
      # Note: sodiboo/niri-flake is unmaintained. If build errors continue,
      # change this line to: url = "github:epireyn/niri-flake";
      url = "github:sodiboo/niri-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    noctalia = {
      url = "github:noctalia-dev/noctalia-shell";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    impermanence = {
      url = "github:nix-community/impermanence";
    };

    disko = {
      url = "github:nix-community/disko";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    distro-grub-themes = {
      url = "github:AdisonCavani/distro-grub-themes";
    };

    stylix = {
      url = "github:danth/stylix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = {
    home-manager,
    niri,
    impermanence,
    disko,
    distro-grub-themes,
    noctalia,
    stylix,
    ...
  }@inputs:
  let
    system = "x86_64-linux";
    username = "req";
  in
  {
    nixosConfigurations.c940 = inputs.nixpkgs.lib.nixosSystem {
      system = system;
      specialArgs = {
        inherit inputs username;
      };

      modules = [
          ./hosts/c940
          impermanence.nixosModules.impermanence
          disko.nixosModules.disko
          distro-grub-themes.nixosModules.${system}.default
          home-manager.nixosModules.home-manager

          # --- FIX: Inline module providing the missing package attribute ---
          ({ ... }: {
            nixpkgs.overlays = [
              (final: prev: {
                libdisplay-info_0_2 = prev.libdisplay-info_0_3 or prev.libdisplay-info;
              })
            ];
          })
          # ------------------------------------------------------------------
      ];
    };

    nixosConfigurations.pi-kube = inputs.nixpkgs.lib.nixosSystem {
      system = "aarch64-linux";
      modules = [
        inputs.nixos-hardware.nixosModules.raspberry-pi-3
        ./hosts/rpi/configuration.nix
      ];
    };
  };
}
