{ config, pkgs, inputs, ... }:
let
  dotfiles = "${config.home.homeDirectory}/.config/nix/dotfiles";
in
{
  home.stateVersion = "24.11"; # Please read the comment before changing.

  manual.json.enable = true;

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
    htop
    pkg-config
    coreutils-full
    gnupg
    nmap
  ];

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file.".tmux.conf".source = config.lib.file.mkOutOfStoreSymlink "${dotfiles}/tmux.conf";

  xdg.enable = true;

  xdg.configFile."nvim" = {
    source = config.lib.file.mkOutOfStoreSymlink "${dotfiles}/nvim";
    recursive = true;
  };

  home.sessionVariables = {
    EDITOR = "vim";
  };

  programs.home-manager.enable = true;

  programs.git = {
    enable = true;
    userName = "Elman Teyubov";
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
    };
  };

  programs.fzf = {
    enable = true;
    enableZshIntegration = true;
  };

}
