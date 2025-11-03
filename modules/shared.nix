{ config, pkgs, lib, inputs, ... }:
{
  options.dotfiles = lib.mkOption {
    type = lib.types.str;
    default = "${config.home.homeDirectory}/.config/nix/dotfiles";
  };
}
