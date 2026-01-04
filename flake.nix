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

    auto-cpufreq = {
      url = "github:AdnanHodzic/auto-cpufreq";
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

  outputs = inputs@{ 
    self,
    nixpkgs,
    home-manager,
    nixos-hardware,
    auto-cpufreq,
    niri,
    noctalia,
    disko,
    impermanence,
    distro-grub-themes,
    ... 
  }: let
    pkgs = import nixpkgs { inherit system; };
    username = "req";
    hostname = "nixos"; 
    system = "x86_64-linux";
  in {
    nixosConfigurations.${hostname} = nixpkgs.lib.nixosSystem {
      system = system;
      specialArgs = {  inherit inputs; };
      modules = [
          ./hosts/home 
          auto-cpufreq.nixosModules.default
          impermanence.nixosModules.impermanence
          disko.nixosModules.disko
          distro-grub-themes.nixosModules.${system}.default
      ];
    };

    homeConfigurations.${username} = home-manager.lib.homeManagerConfiguration {
      inherit pkgs;
      extraSpecialArgs = { inherit inputs; };
      modules = [
        niri.homeModules.niri
        noctalia.homeModules.default
        ./modules/home
      ];
    };

    nixosConfigurations.pi-kube = nixpkgs.lib.nixosSystem {
      system = "aarch64-linux";
      modules = [
        nixos-hardware.nixosModules.raspberry-pi-3
        ./hosts/rpi/configuration.nix
      ];
    };

  };
}
