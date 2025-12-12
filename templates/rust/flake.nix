{
  description = "Rust development flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
  };

  outputs = {self, nixpkgs}:
  let 
    system = "aarch64-darwin";
    pkgs = nixpkgs.legacyPackages.${system};
  in 
  {
    devShells.${system}.default = pkgs.mkShell {
      packages = with pkgs; [ 
          rustup
      ];
      inputsFrom = [pkgs.bat];

      shellHook = ''
          echo "Rust development enviroment"'';
    };
  };
}
