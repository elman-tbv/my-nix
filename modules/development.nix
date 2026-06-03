{
flake.homeModules.development = { config, pkgs, inputs, ... }:
{

# inputs.nixpkgs.config.allowUnfreePredicate =
#   pkg: builtins.elem (pkgs.lib.getName pkg) [
#     "vscode"
#   ];

  home.packages = with pkgs; [
    zed-editor
    python3
    lazygit
    qemu
    nixd
    docker
    podman
  ];

  xdg.configFile."kitty" = {
    source = config.lib.file.mkOutOfStoreSymlink "${config.dotfiles.path}/kitty";
    recursive = true;
  };

  programs.direnv = {
    enable = true;
    nix-direnv.enable = true;
    enableZshIntegration = true;
    enableBashIntegration = true;
  };
};
}
