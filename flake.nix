{
  description = "System Configuration";

  inputs = { 
    nixpkgs.url = "nixpkgs/nixos-unstable";
    nixos-hardware.url = "github:NixOs/nixos-hardware/master";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    auto-cpufreq = {
      url = "github:AdnanHodzic/auto-cpufreq";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    hyprland = {
      url = "github:hyprwm/Hyprland";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    Hyprspace = {
      url = "github:KZDKM/Hyprspace";
      inputs.hyprland.follows = "hyprland";
    };

    hyprland-plugins = {
      url = "github:hyprwm/hyprland-plugins";
      inputs.hyprland.follows = "hyprland";
    };

  };

  outputs = inputs@{ 
    self,
    nixpkgs,
    home-manager,
    nixos-hardware,
    auto-cpufreq,
    hyprland,
    Hyprspace,
    ... 
  }: let
    username = "req";
    hostname = "nixos"; 
    system = "x86_64-linux";
  in
  {
    nixosConfigurations.${hostname} = nixpkgs.lib.nixosSystem {
      system = system;
      specialArgs = { 
        inherit inputs hostname username system auto-cpufreq Hyprspace;
      };
      modules = [
          ./hosts/home 
          auto-cpufreq.nixosModules.default
      ];
    };

    nixosConfigurations.pi-kube = nixpkgs.lib.nixosSystem {
      system = "aarch64-linux";
      modules = [
        nixos-hardware.nixosModules.raspberry-pi-3
        ./hosts/rpi/configuration.nix
      ];
    };

    homeConfigurations.${username} = home-manager.lib.homeManagerConfiguration {
      pkgs = nixpkgs.legacyPackages.${system};
      modules = [
        ./home-manager/home.nix
      ];
      extraSpecialArgs = { inherit inputs hostname system username Hyprspace; };
    };
  };
}
