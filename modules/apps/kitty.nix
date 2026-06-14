{
  flake.homeModules.apps = {config, pkgs, ...}: {
    home.packages = [ pkgs.kitty ];
    xdg.configFile."kitty" = {
      source = config.lib.file.mkOutOfStoreSymlink "${config.dotfiles.path}/kitty";
      recursive = true;
    };
  };
}
