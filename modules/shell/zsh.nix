{
  flake.homeModules.shell = { config, pkgs, ...}: {
    home.packages = with pkgs; [oh-my-zsh zsh-powerlevel10k];
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
        [[ -f ~/.config/zsh/.p10k.zsh ]] && source ~/.config/zsh/.p10k.zsh
        if [[ $- == *i* ]]; then
          bindkey -v
          autoload -U edit-command-line
          zle -N edit-command-line
          bindkey -M vicmd 'v' edit-command-line
        fi
        '';
      shellAliases = {
        ll = "ls -alF";
        la = "ls -A";
        l = "ls -CF";

        ez = "eza --icons --sort=type";
        el = "ez --long --header";
        ea = "ez --all";
      };
    };
    xdg.configFile."zsh/.p10k.zsh" = {
      source = config.lib.file.mkOutOfStoreSymlink "${config.dotfiles.path}/zsh/.p10k.zsh";
      recursive = true;
    };
  };
}
