# ECMA-SL Neovim Plugin (Tree-sitter)

Neovim plugin for the ECMA-SL (ECMAScript-like) language, providing syntax highlighting via Tree-sitter.

**Note**: This plugin requires Neovim and `nvim-treesitter`. It no longer includes the legacy regex-based syntax highlighter.

## Features

- **Tree-sitter Support**: Highly accurate syntax highlighting, indentation, and folding.
- **Filetype Detection**: Automatically handles `.esl` files.
- **Nix Support**: Includes a Nix flake and `default.nix` for easy installation with NixOS and home-manager.

## Installation

### With NixOS and home-manager (Recommended)

Add this to your `home.nix`:

```nix
{
  programs.neovim = {
    enable = true;
    plugins = with pkgs.vimPlugins; [
      ecmasl-vim
    ];
  };

  # Make the plugin available
  nixpkgs.overlays = [
    (final: prev: {
      ecmasl-vim = prev.vimUtils.buildVimPlugin {
        pname = "ecmasl-vim";
        version = "unstable";
        src = builtins.fetchGit {
          url = "https://github.com/yourusername/ecmasl-vim";
          # Or point to your local clone
          # url = "/path/to/your/ecmasl-vim/clone";
        };
      };
    })
  ];
}
```

Then, ensure your grammar is installed (usually via `programs.neovim.plugins` including the grammar or adding it to `treesitter.parsers`).

### With `lazy.nvim`

```lua
{
  "yourusername/ecmasl-vim",
  dependencies = { 
    { "nvim-treesitter/nvim-treesitter", branch = "main" } 
  },
}
```

## License

MIT
