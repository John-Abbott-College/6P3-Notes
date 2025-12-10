{
  description = "Develop Python on Nix with uv";

  inputs = { nixpkgs.url = "github:nixos/nixpkgs/nixos-25.11"; };

  outputs = { nixpkgs, ... }:
    let
      inherit (nixpkgs) lib;
      forAllSystems = lib.genAttrs lib.systems.flakeExposed;
    in {
      devShells = forAllSystems (system:
        let
          pkgs = nixpkgs.legacyPackages.${system};
          pythonEnvPkgs = with pkgs; [
            python314
            uv # Modern Python dependency manager replacing virtualenv and pip
          ];
          pythonCLibraries = with pkgs; [
            # On Nix at least, a few C-libraries are needed explicitly for LD path.
            gcc
            stdenv.cc.cc.lib
            zlib
            libglvnd
            libxkbcommon
            fontconfig
            libx11
            glib
            freetype
            zstd
            dbus
            libxcb-cursor
            wayland
          ];
          allPackages = pythonEnvPkgs ++ pythonCLibraries;
        in {
          default = pkgs.mkShell {
            packages = allPackages;

            shellHook = ''
              export LD_LIBRARY_PATH=${
                pkgs.lib.makeLibraryPath allPackages
              }:$LD_LIBRARY_PATH
              export QT_QPA_PLATFORM="wayland"
              unset PYTHONPATH
              uv sync
              . .venv/bin/activate
            '';
          };
        });
    };
}
