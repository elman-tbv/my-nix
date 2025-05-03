{ config, pkgs, ... }:

{
  home.username = "elman";
  home.homeDirectory = "/Users/elman";

  home.stateVersion = "24.11"; # Please read the comment before changing.

  nixpkgs.config.allowUnfreePredicate = 
    pkg: builtins.elem (pkgs.lib.getName pkg) [
      "vscode"
    ];

  home.packages = with pkgs; [
    vscode
    zsh
    fzf
    neovim
    curl
    wget
  ];

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
    # ".screenrc".source = dotfiles/screenrc;
  };

  home.sessionVariables = {
     EDITOR = "vim";
  };

  programs.home-manager.enable = true;

  programs.git = {
    enable = true;
    userName = "elman";
    userEmail = "elman.teyubov@gmail.com";
    aliases = {
    };
  };

  programs.zsh = {
    enable = true;
  };

  programs.fzf = {
    enable = true;
    enableZshIntegration = true;
  };
}
