{
  flake.nixosModules.desktop = { config, pkgs, inputs, ...}: {
    programs.firefox.enable = true;

    environment.systemPackages = with pkgs; [
      vim
      git
      home-manager
    ];

    # Set your time zone.
    time.timeZone = "Asia/Baku";

    # Select internationalisation properties.
    i18n.defaultLocale = "en_US.UTF-8";

    i18n.extraLocaleSettings = {
      LC_ADDRESS = "az_AZ";
      LC_IDENTIFICATION = "az_AZ";
      LC_MEASUREMENT = "az_AZ";
      LC_MONETARY = "az_AZ";
      LC_NAME = "az_AZ";
      LC_NUMERIC = "az_AZ";
      LC_PAPER = "az_AZ";
      LC_TELEPHONE = "az_AZ";
      LC_TIME = "az_AZ";
    };

    # Enable the X11 windowing system.
    services.xserver.enable = true;

    # Enable the GNOME Desktop Environment.
    services.xserver.displayManager.gdm.enable = true;
    services.xserver.desktopManager.gnome.enable = true;

    # Configure keymap in X11
    services.xserver.xkb = {
      layout = "us";
      variant = "";
    };

  };
}
