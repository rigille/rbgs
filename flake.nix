{
  description = "Refinement-based game semantics";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs?ref=24.05";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = nixpkgs.legacyPackages.${system};
        ocamlPackages = pkgs.ocaml-ng.ocamlPackages_4_10;
      in
      {
        devShells = {
          default = pkgs.mkShell {
            # Development tools
            packages = [
              pkgs.coq_8_15
              ocamlPackages.ocaml
              ocamlPackages.menhirLib
              ocamlPackages.menhir
            ];
          };
        };
      });
}
