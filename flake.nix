{
  description = "tree-sitter-pydoc flake";

  inputs = {
    nixpkgs = {url = "github:NixOS/nixpkgs/nixpkgs-unstable";};
    flake-utils = {url = "github:numtide/flake-utils";};
  };

  outputs = {
    nixpkgs,
    flake-utils,
    ...
  }:
    flake-utils.lib.eachDefaultSystem (system: let
      pkgs = import nixpkgs {inherit system;};

      tree-sitter = pkgs.tree-sitter;
    in {
      devShell = pkgs.mkShell {
        buildInputs = [
          tree-sitter
        ];
      };
    });
}
