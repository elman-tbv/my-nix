{ config, pkgs, ... }:
{

  nixpkgs.config.allowUnfreePredicate = 
    pkg: builtins.elem (pkgs.lib.getName pkg) [
      "vscode"
    ];

  home.packages = with pkgs; [
    neovim
    vscode
    #gcc
    clang
    clang-tools
    cmake
    ninja
    python3
  ];

  programs.vscode.profiles.default = {
    enable = true;
    enableUpdateCheck = true;
    enableExtensionUpdateCheck = true;
    extensions = with pkgs.vscode-extensions; [
      ms-vscode.cpptools-extension-pack
      vscodevim.vim
      haskell.haskell
    ];
  };
 
  home.sessionVariables = {
    CC = "gcc";
    CXX = "g++";
  };

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
    # ".screenrc".source = dotfiles/screenrc;
  };
}
