{
  flake.homeModules.apps = {config, pkgs, ...}: {
    home.packages = [ pkgs.neovim ];
    xdg.configFile."nvim" = {
      source = config.lib.file.mkOutOfStoreSymlink "${config.dotfiles.path}/nvim";
      recursive = true;
    };
    home.sessionVariables = {
      EDITOR = "nvim";
    };
  };
}
