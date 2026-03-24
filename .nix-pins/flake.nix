{
  description = "A flake for ecmasl-vim";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = nixpkgs.legacyPackages.${system};
        ecmasl-vim = pkgs.vimUtils.buildVimPlugin {
          name = "ecmasl-vim";
          src = self;
          buildInputs = [ pkgs.tree-sitter ];
        };
      in {
        packages.default = ecmasl-vim;
        devShells.default = pkgs.mkShell {
          buildInputs = [ pkgs.tree-sitter ];
        };
      });
}
