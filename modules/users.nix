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

    homeModules.users = {
      home = {
        username = "elman";
        homeDirectory = "/home/elman";
      };
    };
  };
}
