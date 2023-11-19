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
    system = "x86_64-linux";
  in
  {
    nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
      specialArgs = { inherit inputs username system; };
      modules = [ ./hosts/home ];
    };

    homeConfigurations."${username}" = home-manager.lib.homeManagerConfiguration {
      pkgs = nixpkgs.legacyPackages.x86_4-linux;
      extraSpecialArgs = { inherit inputs username; };
      modules = [ 
        hyprland.homeManageModules.default
        {wayland.windowManager.hyprland.enable = true;}
        ./home-manager/home.nix 
      ];
    };
  };
}
