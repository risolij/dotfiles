{
  description = "System Configuration";

  nixConfig = {
    experimental-features = ["nix-command" "flakes" ];
  };

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
  };

  outputs = { self, nixpkgs, home-manager, hyprland, ... }@inputs: 
  let
    username = "req";
    name = "nixos"; 
    system = "x86_64-linux";
  in
  {
    nixosConfigurations.${name} = nixpkgs.lib.nixosSystem {
      specialArgs = { 
        inherit inputs;
        inherit name;
        inherit username;
        inherit system; 
      };
      modules = [
        ./hosts/home 
      ];
    };

    homeConfigurations."${username}" = home-manager.lib.homeManagerConfiguration {
      pkgs = nixpkgs.legacyPackages.${system};
      modules = [
        ./home-manager/home.nix
      ];
      extraSpecialArgs = {
        inherit inputs;
        inherit name;
        inherit system;
        inherit username;
      };
    };
  };
}
