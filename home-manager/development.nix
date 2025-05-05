{ config, pkgs, ... }:
{

  nixpkgs.config.allowUnfreePredicate = 
    pkg: builtins.elem (pkgs.lib.getName pkg) [
      "vscode"
    ];

  home.packages = with pkgs; [
    neovim
    vscode
  ];

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
    # ".screenrc".source = dotfiles/screenrc;
  };
}
