{self, inputs, ... }: {
  flake.nixosConfigurations.nixos-vm = inputs.nixpkgs.lib.nixosSystem {
    #specialArgs = { inherit inputs; };
    #system = "aarch65-linux";
    modules = [
      #self.nixosModules.configuration
      #self.nixosModules.nixosvm-hardware
      ./hosts/nixos-vm/configuration.nix
#      ./hosts/nixos-vm/hardware-configuration.nix
    ];
  };
}
