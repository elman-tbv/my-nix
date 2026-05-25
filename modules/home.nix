{self, inputs, ...}: {
  flake.homeConfigurations = {
    elman = inputs.home-manager.lib.homeManagerConfiguration {
      pkgs = import inputs.nixpkgs { system = "aarch64-linux"; };
      modules = with self.homeModules; [
        base
        dotfiles
        development
        users
        shell
        apps
      ];
    };
  };
}
