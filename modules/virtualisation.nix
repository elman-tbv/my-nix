{
  flake.nixosModules.virtualisation = {config, pkgs, inputs, ...}:
  {
    virtualisation.docker.enable = true;
  };

  flake.homeModules.virtualisation = {config, pkgs, inputs, ...}:
  {
    programs.docker-cli.enable = true;
    services.podman.enable = true;
  };
}
