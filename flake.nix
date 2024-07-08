{
  description = "System Configuration";

  inputs = { 
    nixpkgs.url = "nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    hyprland = {
      url = "github:hyprwm/Hyprland";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    inputs.nixos-hardware.url = "github:NixOs/nixos-hardware/master";
  };

  outputs = { self, nixpkgs, home-manager, hyprland, nixos-hardware, ... }@inputs: 
  let
    username = "req";
    hostname = "nixos"; 
    system = "x86_64-linux";
  in
  {
    nixosConfigurations = {
      ${hostname} = nixpkgs.lib.nixosSystem {
        specialArgs = { inherit inputs hostname username system;  };
        modules = [
            ./hosts/home 
        ];
      };

      pi-kube = nixpkgs.lib.nixosSystem {
        modules = [
          nixos-hardware.nixosModules.raspberry-pi.3
          ./hosts/rpi/configuration.nix
        ];
      };
    };

    homeConfigurations = {
      ${username} = home-manager.lib.homeManagerConfiguration {
        pkgs = nixpkgs.legacyPackages.${system};
        modules = [
          ./home-manager/home.nix
        ];
        extraSpecialArgs = { inherit inputs hostname system username; };
      };
    };

  };
}
