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
    imp = impermanence.nixosModules.impermanence;
    dis = disko.nixosModules.disko;
    dgt = distro-grub-themes.nixosModules.${system}.default;
    hm = home-manager.nixosModules.home-manager;
  in
  {
    nixosConfigurations.nixos = inputs.nixpkgs.lib.nixosSystem {
      system = system;
      modules = [
          ./hosts/home 
          imp
          dis
          dgt
          hm {
            home-manager.useUserPackages = true;
            home-manager.extraSpecialArgs = { inherit inputs username; };
            home-manager.users."${username}" = import ./modules/home;
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
