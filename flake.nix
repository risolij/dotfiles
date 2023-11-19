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

  outputs = { self, nixpkgs, home-manager, hyprland, ... }: 
  {
    nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";

      modules = [
        ./hosts/home

        hyprland.nixosModules.default
        { 
          programs.hyprland.enable = true; 
        }
      ];
    };
  };
}
