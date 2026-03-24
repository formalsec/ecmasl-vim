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
      {
        plugin = ecmasl-vim;
        config = ''
          lua require("ecmasl").setup()
        '';
      }
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

Then, in your Neovim config, ensure `nvim-treesitter` is set up:

```lua
require('nvim-treesitter.configs').setup {
  -- ensure_installed = { "c", "lua", "ecmasl" }, -- You can add ecmasl here
  highlight = {
    enable = true,
  },
}
```

### With `lazy.nvim`

```lua
{
  "yourusername/ecmasl-vim",
  dependencies = { "nvim-treesitter/nvim-treesitter" },
  config = function()
    require("ecmasl").setup()
    -- You may need to run :TSInstall ecmasl if not using Nix
  end
}
```

## License

MIT
