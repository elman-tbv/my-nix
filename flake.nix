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
  };

  outputs = inputs@{ self, nix-darwin, nixpkgs, home-manager, nix-homebrew }:
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

    homeConfigurations = {
      "elman@macos" = home-manager.lib.homeManagerConfiguration {
        home.username = "elman";
        home.homeDirectory = "/Users/elman";
        inherit pkgs;
        modules = [
          ./home-manager/default.nix
          ./home-manager/development.nix
        ];
      };
  };
}
