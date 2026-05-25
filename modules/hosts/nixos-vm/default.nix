{self, inputs, ... }: {
  flake.nixosConfigurations.nixos-vm = inputs.nixpkgs.lib.nixosSystem {
    modules = with self.nixosModules;
    [
      qemu-hardware
      base
      desktop
      users
      services
      home-manager
    ];
  };
}
