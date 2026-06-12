{
  flake = {
    nixosModules.users = {pkgs, ...}: {
      programs.zsh.enable = true;
      users.users = {
        elman = {
          isNormalUser = true;
          description = "elman";
          extraGroups = [ "networkmanager" "wheel" ];
          shell = pkgs.zsh;
        };
      };
    };

    homeModules.users = {pkgs, ...}: {
      home = {
        username = "elman";
        homeDirectory = if pkgs.stdenv.isDarwin
                        then "/Users/elman"
                        else "/home/elman";
      };
    };
  };
}
