{self, inputs, ... }: {
  flake.nixosConfigurations.nixos-vm = inputs.nixpkgs.lib.nixosSystem {
    modules = with self.nixosModules;[
      nixos-vm-configuration
      qemu-hardware
    ];
  };
}
