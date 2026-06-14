{
  flake.homeModules.shell = { config, pkgs, inputs, ... }:
  {
    programs.lazygit = {
      enable = true;
      enableZshIntegration = true;
    };
  };
}
