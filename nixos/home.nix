{ config, pkgs, inputs, ... }:
{
  home.username = "elman";
  home.homeDirectory = "/home/elman";
  imports = [
    ../home-manager/default.nix
    ../home-manager/development.nix
    ../home-manager/linux-gui.nix
    ../home-manager/hyprland.nix
  ];
}
