{ config, pkgs, inputs, ... }:
{
  environment.systemPackages = with pkgs; [
    waybar
    mako # notification daemon
    libnotify
    hyprpaper # wallpapers
    rofi  # app launcher
    nautilus
  ];

  programs.hyprland = {
    enable = true;
    package = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.hyprland;
    portalPackage = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.xdg-desktop-portal-hyprland;
    xwayland.enable = true;
  };

  programs.xwayland.enable = true;
}
