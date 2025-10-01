{ config, pkgs, ... }:
{

  nixpkgs.config.allowUnfreePredicate = 
    pkg: builtins.elem (pkgs.lib.getName pkg) [
      "vscode"
    ];

  home.packages = with pkgs; [
    neovim
    vscode
    gcc
    gdb
    python3
    direnv
    lazygit
    qemu
    virt-manager
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

  programs.direnv = {
    enable = true;
    enableZshIntegration = true;
    enableBashIntegration = true;
  };

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
    # ".screenrc".source = dotfiles/screenrc;
  };
}
