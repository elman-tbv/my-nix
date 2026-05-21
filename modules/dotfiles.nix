{
#flake.modules.homeManager.dotfiles = { config, lib, ... }:
flake.homeModules.dotfiles = { config, lib, ... }:
{
  options.dotfiles.path = lib.mkOption {
    type = lib.types.str;
    default = "${config.home.homeDirectory}/.config/nix/dotfiles";
    description = "defines dotfiles directory path";
  };
};
}
