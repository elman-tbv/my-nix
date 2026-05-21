{
  flake.modules.user = { 
    elman = {
      system = {
        isNormalUser = true;
        description = "elman";
        extraGroups = [ "networkmanager" "wheel" ];
      };
      home = {
        username = "elman";
        homeDirectory = "/home/elman";
      };
    };
  };
}
