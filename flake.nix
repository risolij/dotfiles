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
      url = "github:sodiboo/niri-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    noctalia = {
      url = "github:noctalia-dev/noctalia-shell";
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
  };

  outputs = { 
    home-manager,
    niri,
    impermanence,
    disko,
    distro-grub-themes,
    noctalia,
    ...
  }@inputs: {
    nixosConfigurations.nixos = inputs.nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      specialArgs = {  inherit inputs; };
      modules = [
          ./hosts/home 
          impermanence.nixosModules.impermanence
          disko.nixosModules.disko
          distro-grub-themes.nixosModules."x86_64-linux".default
          home-manager.nixosModules.home-manager {
            home-manager.useUserPackages = true;
            home-manager.extraSpecialArgs = { inherit inputs; };
            home-manager.users.req = import ./modules/home;
          }
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
