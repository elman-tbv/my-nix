{
  description = "Elman nix-darwin system flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    nix-darwin = {
      url = "github:LnL7/nix-darwin";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nix-homebrew.url = "github:zhaofengli-wip/nix-homebrew";
    hyprland.url = "github:hyprwm/Hyprland";
  };

  outputs = { self, nix-darwin, nixpkgs, home-manager, nix-homebrew, ... } @inputs :
  let
    system = "aarch64-darwin";
    pkgs = nixpkgs.legacyPackages.${system};
  in {
    # Build darwin flake using:
    # $ darwin-rebuild build --flake .#MacBook-Air-Elman
    darwinConfigurations."MacBook-Air-Elman" = nix-darwin.lib.darwinSystem {
      modules = [
        ./macos/configuration.nix 
        nix-homebrew.darwinModules.nix-homebrew {
          nix-homebrew = {
            enable = true;
            enableRosetta = true;
            user = "elman";
            autoMigrate = true;
          };
        }
      ];
    };
    darwinPackages = self.darwinConfigurations."MacBook-Air-Elman".pkgs;

    nixosConfigurations.laptop = nixpkgs.lib.nixosSystem {
      specialArgs = { inherit inputs; };
      modules = [
        ./nixos/configuration.nix
        ./nixos/hardware-configuration.nix
      ];
    };

    nixosConfigurations.nixos-vm = nixpkgs.lib.nixosSystem {
      specialArgs = { inherit inputs; };
      modules = [
        ./nixos-vm/configuration.nix
        ./nixos-vm/hardware-configuration.nix
      ];
    };

    homeConfigurations = {
      "elman@macos" = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        modules = [
          ./macos/home.nix
          ./modules/shared.nix
        ];
        extraSpecialArgs = { inherit inputs; };
      };

      "elman@nix" = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        modules = [
          ./nixos/home.nix
          ./modules/shared.nix
        ];
        extraSpecialArgs = { inherit inputs; };
      };
    };

    templates = {
      cpp = {
        path = ./templates/cpp;
        description = "C/C++ template for development enviroment";
      };
      opengl = {
        path = ./templates/opengl;
        description = "OpenGL development enviroment";
      };
      rust = {
        path = ./templates/rust;
        description = "Rust development enviroment";
      };
    };

  };
}
