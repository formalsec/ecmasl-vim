{
  description = "ECMA-SL Tree-sitter grammar and Vim plugin";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, utils }:
    utils.lib.eachDefaultSystem (system:
      let
        pkgs = import nixpkgs { inherit system; };
        # Import the logic we just wrote in default.nix
        ecmasl-stuff = import ./default.nix { inherit pkgs; };
      in
      {
        # 'packages' lets you run 'nix build' locally to test
        packages = {
          default = ecmasl-stuff.ecmasl-vim;
          grammar = ecmasl-stuff.ecmasl-grammar;
        };

        # This allows you to reference them in your system config
        overlays.default = final: prev: {
          ecmasl-vim = ecmasl-stuff.ecmasl-vim;
          ecmasl-grammar = ecmasl-stuff.ecmasl-grammar;
        };
      }
    );
}
