{
  description = "OpenGL development enviroment";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
  };

  outputs = {self, nixpkgs, ...}@inputs:
    let
      supportedSystems = [
        "x86_64-linux"
        "aarch64-linux"
        "aarch64-darwin"
      ];
      forEachSystem = f:
        nixpkgs.lib.genAttrs supportedSystems ( system: f {
          pkgs = import nixpkgs {inherit system; };
        }
      );
    in 
  {
    devShells = forEachSystem (
      { pkgs }:
      {
        default = pkgs.mkShell {
          packages = with pkgs; [
            clang-tools
            clang
            cmake
            extra-cmake-modules
            ninja
            autoconf
            automake
            autoconf-archive
            libtool
            pkg-config
            glxinfo
            wayland
            wayland-scanner
            wayland-protocols
            libxkbcommon
            libffi
            libx11
            libxrandr
            libxinerama
            libxcursor
            libxi
            mesa
            libGL
            libGLU
          ];
        };

        shellHook = ''
            export VCPKG_ROOT=$(pwd)/app/vcpkg
            export PATH=$VCPKG_ROOT:$PATH
            '';
      }

    );
     
  };
  
}
