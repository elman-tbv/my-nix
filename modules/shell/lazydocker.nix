{
  flake.homeModules.shell = { config, pkgs, inputs, ...}: {
    programs.lazydocker = {
      enable = true;
    };
  };
}
