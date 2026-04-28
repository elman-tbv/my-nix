{self, inputs, ... }: {
  flake.nixosConfigurations.nixos-vm = inputs.nixpkgs.lib.nixosSystem {
    system = "aarch64-linux";
    modules = [
      self.nixosModules.nixos-vm-configuration
      self.nixosModules.qemu-hardware
    ];
  };
}
