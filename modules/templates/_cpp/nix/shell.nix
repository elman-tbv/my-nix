{
  perSystem =
    { config, pkgs, inputs, ... }:
    let 
      darwinPkgs = with pkgs; [
        apple-sdk_26
      ];
      linuxPkgs = with pkgs; [
        gcc
        gdb
        lldb
      ];
    in
    {
      devShells.default = pkgs.mkShell {
        packages = with pkgs; [
          libcxx
          clang-tools
          clang
          cmake
          ninja
        ]
        ++ lib.optionals pkgs.stdenv.isDarwin darwinPkgs
        ++ lib.optionals pkgs.stdenv.isLinux linuxPkgs;


        #shellHook = ''
        #  ${config.pre-commit.settings.shellHook}
        #'';
      };
    };
}
