{ self, inputs, ... }: {
  flake.nixosModules.home-manager = { pkgs, ... }: {
    imports = [
      inputs.home-manager.nixosModules.default # import official home-manager NixOS module
    ];

    home-manager = {
      useGlobalPkgs = true;
      useUserPackages = true;
    };
  };

  flake.homeModules.base = { self, config, pkgs, inputs, ... }: {
    home.stateVersion = "26.05"; # Please read the comment before changing.

    manual.json.enable = true;
    xdg.enable = true;

    programs.git = {
      enable = true;
      settings = {
        user.name = "Elman Teyubov";
        user.email = "elman.teyubov@gmail.com";
        alias = {
        };
      };
    };
  };
}
