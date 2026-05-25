{
  flake.homeManager.shell = {config, pkgs, inputs, ...}:
let
  tpmRepo = pkgs.fetchFromGitHub {
    owner = "tmux-plugins";
    repo = "tpm";
    rev = "v3.1.0";
    sha256 = "sha256-CeI9Wq6tHqV68woE11lIY4cLoNY8XWyXyMHTDmFKJKI=";
  };
in
{
  programs.tmux.enable = true;
  home.file.".tmux/plugins/tpm" = {
    source = "${tpmRepo}";
    recursive = true;
  };
  home.file.".tmux.conf".source = config.lib.file.mkOutOfStoreSymlink "${config.dotfiles}/tmux.conf";
};
}
