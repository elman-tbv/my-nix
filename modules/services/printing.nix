{
  flake.nixosModules.services = {
    # Enable CUPS to print documents.
    services.printing.enable = true;
  };
}
