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
        [[ -f ~/.p10k.zsh ]] && source ~/.p10k.zsh
        '';
      shellAliases = {
      };
    };
  };
}
