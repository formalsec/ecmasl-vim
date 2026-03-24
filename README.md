# ECMA-SL Neovim Plugin

Vim/Neovim plugin for the ECMA-SL (ECMAScript-like) language, featuring Tree-sitter support.

## Features

- **Tree-sitter Support**: Highly accurate syntax highlighting, indentation, and folding.
- **Vim Syntax Support**: Fallback regex-based highlighting for older Vim versions.
- **Filetype Detection**: Automatically handles `.esl` files.
- **Nix Support**: Includes a Nix flake and `default.nix` for easy installation with NixOS and home-manager.

## Installation

### Neovim with `nvim-treesitter` (Recommended)

#### With NixOS and home-manager

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

Then, in your Neovim config, ensure `nvim-treesitter` is set up and that `ecmasl` is in your list of highlighted languages:

```lua
require('nvim-treesitter.configs').setup {
  ensure_installed = { "c", "lua" }, -- etc.
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
}
```

#### With `lazy.nvim`

```lua
{
  "yourusername/ecmasl-vim",
  dependencies = { "nvim-treesitter/nvim-treesitter" },
  config = function()
    require("ecmasl").setup()
  end
}
```

## License

MIT
