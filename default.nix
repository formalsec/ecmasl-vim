{ pkgs ? import <nixpkgs> {} }:

let
  # The source is the root of the repo
  src = ./.;
in
{
  # 1. The Compiled Grammar (.so file)
  ecmasl-grammar = pkgs.tree-sitter.buildGrammar {
    language = "ecmasl";
    version = "0.1.0";
    inherit src;
    # Tell Nix to look inside the subfolder for grammar.js/src/parser.c
    location = "tree-sitter-ecmasl";
  };

  # 2. The Vim Plugin (for highlights.scm and ftdetect)
  ecmasl-vim = pkgs.vimUtils.buildVimPlugin {
    pname = "ecmasl-vim";
    version = "unstable";
    inherit src;
  };
}
