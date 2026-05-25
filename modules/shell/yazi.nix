{
  flake.homeModules.shell = { config, pkgs, inputs, ...}: {
    home.packages = with pkgs; [ yazi ];
    xdg.configFile."yazi" = {
      source = config.lib.file.mkOutOfStoreSymlink "${config.dotfiles.path}/yazi";
      recursive = true;
    };
  };
}
