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
          nodeEnvPkgs = with pkgs; [
            nodejs_24 # Required for myst
            nodePackages.pnpm
            (yarn.override { nodejs = nodejs_24; })
          ];

          tex = pkgs.texlive.combine {
            inherit (pkgs.texlive)
              scheme-small latex-bin latexmk xelatex-dev exam minted enumitem
              titlesec wrapfig changepage framed;
          };
          documentationPkgs = with pkgs; [
            typst # Used for PDF generation
            imagemagick # Required to process SVGs for PDFs
            tex
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
          allPackages = pythonEnvPkgs ++ nodeEnvPkgs ++ pythonCLibraries
            ++ documentationPkgs;
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
              pnpm install --prefer-frozen-lockfile
            '';
          };
        });
    };
}
