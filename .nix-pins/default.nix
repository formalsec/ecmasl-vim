{ pkgs ? import <nixpkgs> {} }:

pkgs.vimUtils.buildVimPlugin {
  name = "ecmasl-vim";
  src = ./.;
  buildInputs = [ pkgs.tree-sitter ];
}
