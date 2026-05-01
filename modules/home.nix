{self, inputs, ...}: {
  flake.homeConfigurations.elman = inputs.home-manager.lib.homeManagerConfiguration {
    pkgs = import inputs.nixpkgs { system = "aarch64-linux"; };
    modules = [
      self.homeModules.elmanModule
    ];
  };
}
