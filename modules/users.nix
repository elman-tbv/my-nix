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

    modules.homeManager.users = {
      home = {
        username = "elman";
        homeDirectory = "/home/elman";
      };
    };
  };
}
