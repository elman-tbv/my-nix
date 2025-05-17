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
    zsh
    oh-my-zsh
    zsh-powerlevel10k
    vim
    fzf
    curl
    wget
    tmux
    bat
    thefuck
    htop
  ];

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
    ".tmux.conf".source = ../../home-manager/dotfiles/tmux.conf;
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
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
    oh-my-zsh = {
      enable = true;
      theme = "powerlevel10k";
      plugins = [
        "git"
        "z"
        "sudo"
        "web-search"
      ];
    custom = "${pkgs.zsh-powerlevel10k}/share/zsh-powerlevel10k";
    };
    initContent = ''
      [[ -f ~/.p10k.zsh ]] && source ~/.p10k.zsh
      '';
    shellAliases = {
      fk = "fuck";
    };
  };

  programs.fzf = {
    enable = true;
    enableZshIntegration = true;
  };

  programs.thefuck = {
    enable = true;
    enableZshIntegration = true;
    enableInstantMode = false;
  };
}
