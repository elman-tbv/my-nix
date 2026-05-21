{self, inputs, ...}: {
  flake.homeConfigurations = {
    elman = inputs.home-manager.lib.homeManagerConfiguration {
      pkgs = import inputs.nixpkgs { system = "aarch64-linux"; };
      modules = [
        {
          imports = with self.homeModules; [
            default
            dotfiles
            development
          ];
          programs.home-manager.enable = true;
        }
      ];
    };
  };
}
