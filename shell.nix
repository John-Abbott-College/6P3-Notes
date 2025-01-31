let
  pkgs = import <nixpkgs> {};
in pkgs.mkShell {
  packages = [
    pkgs.python312
    pkgs.python312Packages.pip
    pkgs.pdm
    pkgs.htmlq
  ];

  shellHook = ''
      eval $(pdm venv activate in-project)
  '';
}
