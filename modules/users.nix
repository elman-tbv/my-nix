{
  flake = {
    nixosModules.users = {
      users.users = {
        elman = {
          isNormalUser = true;
          description = "elman";
          extraGroups = [ "networkmanager" "wheel" ];
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
