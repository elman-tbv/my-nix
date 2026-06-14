{
  flake.homeModules.shell = {config, pkgs, ...}: {
    home.packages = with pkgs; [
      curl
      wget
      bat
      htop
      pkg-config
      coreutils-full
      gnupg
      nmap
      zip
      unzip
      eza
      nixd
    ];
    programs.direnv = {
      enable = true;
      nix-direnv.enable = true;
      enableZshIntegration = true;
      enableBashIntegration = true;
    };
  };
}
