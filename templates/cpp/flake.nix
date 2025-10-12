{
  description "C/C++ development enviroment";

  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";

  outputs = {self, nixpkgs, ...}@inputs:
    let
      supportedSystems = [
        "x86_64-linux"
        "aarch64-linux"
        "aarch64-darwin"
      ];
      forEachSystem = f:
        nixpkgs.lib.getAttrs supportedSystems ( system: f {
          pkgs = import nixpkgs {inherit system; };
        };
    in 
  {
    devShells = forEachSystem (
      { pkgs }:
      {
        default = pkgs.mkShell {
          packages = with pgs; [
            clang-tools
            clang
            cmake
            ninja
            autoconf
            automake
            automake-archive
            libtool
          ];
        };
      }

    );
     
  };
  
}
