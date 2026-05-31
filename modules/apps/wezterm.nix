{
  flake.homeModules.apps = {config, pkgs, ...}: {
    home.packages = [ pkgs.wezterm ];
    xdg.configFile."wezterm" = {
      source = config.lib.file.mkOutOfStoreSymlink "${config.dotfiles.path}/wezterm";
      recursive = true;
    };
  };
}
