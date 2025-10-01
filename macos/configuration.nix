{config, pkgs, ... }: {
  # List packages installed in system profile. To search by name, run:
  # $ nix-env -qaP | grep wget
    environment.systemPackages = with pkgs;
      [ 
        home-manager
        xquartz
        mkalias # makes visible apps for spotlight
        utm
      ];

    homebrew = {
      enable = true;
      brews = [
        "mas"
      ];
      casks = [
        # place hear homebrew apps
        # Yoink = 'value' (can be get via cmd 'mas search Yoink')
        "balenaetcher"
      ];
      masApps = {
        # place apps from Apps Store
      };
      onActivation.cleanup = "zap"; # remove homebrew packages installed outside
      onActivation.autoUpdate = true;
      onActivation.upgrade = true;
    };

    system.keyboard = {
      enableKeyMapping = true;
      remapCapsLockToControl = true;
    };

    system.primaryUser = "elman";

    system.activationScripts.applications.text = let
      env = pkgs.buildEnv {
        name = "system-applications";
        paths = config.environment.systemPackages;
        pathsToLink = "/Applications";
      };
    in
      pkgs.lib.mkForce ''
      # Set up applications.
      echo "setting up /Applications..." >&2
      rm -rf /Applications/Nix\ Apps
      mkdir -p /Applications/Nix\ Apps
      find ${env}/Applications -maxdepth 1 -type l -exec readlink '{}' + |
      while read -r src; do
        app_name=$(basename "$src")
        echo "copying $src" >&2
        ${pkgs.mkalias}/bin/mkalias "$src" "/Applications/Nix Apps/$app_name"
      done
        '';

    nixpkgs.config.allowUnfree = true;

    system.defaults = {
      dock.autohide = true;
    };
    # Necessary for using flakes on this system.
    nix.settings.experimental-features = "nix-command flakes";

    # Enable alternative shell support in nix-darwin.
    # programs.zsh.enable = true;

    # Set Git commit hash for darwin-version.
    #system.configurationRevision = self.rev or self.dirtyRev or null;

    # Used for backwards compatibility, please read the changelog before changing.
    # $ darwin-rebuild changelog
    system.stateVersion = 5;

    # The platform the configuration will be used on.
    nixpkgs.hostPlatform = "aarch64-darwin";

    security.pam.services.sudo_local.touchIdAuth = true;

    fonts.packages = with pkgs; [
      nerd-fonts.jetbrains-mono
    ];
}
