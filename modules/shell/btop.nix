{
  flake.homeModules.shell = { config, pkgs, inputs, ...}: {
    home.packages = with pkgs; [ btop ];
    xdg.configFile."btop" = {
      source = config.lib.file.mkOutOfStoreSymlink "${config.dotfiles.path}/btop";
      recursive = true;
    };
  };
}
