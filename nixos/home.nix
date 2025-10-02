{ config, pkgs, ... }:
{
  home.username = "elman";
  home.homeDirectory = "/home/elman";
  imports = [
    ../home-manager/default.nix
    ../home-manager/development.nix
  ];
}
