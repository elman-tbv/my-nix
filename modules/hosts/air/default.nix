{self, inputs, ... }: {
  flake.darwinConfigurations."MacBook-Air-Elman" = inputs.nix-darwin.lib.darwinSystem {
    modules = with self.darwinModules;
    [
      base
      inputs.nix-homebrew.darwinModules.nix-homebrew {
        nix-homebrew = {
          enable = true;
          enableRosetta = true;
          user = "elman";
          autoMigrate = true;
        };
      }
      home-manager
    ];
  };
}
