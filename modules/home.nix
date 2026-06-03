{self, inputs, ...}: {
  perSystem = {pkgs, system, ...}: {
    legacyPackages.homeConfigurations = {
      elman = inputs.home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
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
  };
}
