{self, inputs, ...}: {
  perSystem = {pkgs, system, ...}: {
    legacyPackages.homeConfigurations = {
      elman = inputs.home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        modules = with self.homeModules; [
        {
          imports = [
            inputs.noctalia.homeModules.default
            inputs.niri.homeModules.niri
          ];
        }
          base
          dotfiles
          development
          users
          shell
          apps
          desktop
          virtualisation
        ];
      };
    };
  };
}
