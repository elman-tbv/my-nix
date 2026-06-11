{ self, inputs, ... }: {
  flake.nixosModules.desktop = { config, pkgs, inputs, ...}: {
    programs.niri.enable = true;
    xdg.portal.wlr.enable = true;
  };

  flake.homeModules.desktop = { self, config, pkgs, inputs, ...}: {
    programs.niri.enable = true;
    programs.niri.package = pkgs.niri;
    xdg.configFile."niri" = {
      source = config.lib.file.mkOutOfStoreSymlink "${config.dotfiles.path}/niri";
      recursive = true;
    };

    programs.noctalia = {
      enable = true;
    };
    xdg.configFile."noctalia" = {
      source = config.lib.file.mkOutOfStoreSymlink "${config.dotfiles.path}/noctalia";
      recursive = true;
    };
  };
}
