{ config, pkgs, ... }:
{
  home.username = "elman";
  home.homeDirectory = "/Users/elman";
  imports = [
    ../home-manager/default.nix
    ../home-manager/development.nix
  ];

  home.packages = with pkgs; [
    lima
    utm
  ];
}
