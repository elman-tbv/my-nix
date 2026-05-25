{
  flake.homeModules.shell = { config, pkgs, inputs, ...}: {
    programs.fzf = {
      enable = true;
      enableZshIntegration = true;
    };
  };
}
