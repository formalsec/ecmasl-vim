# ECMA-SL Neovim Plugin

Vim/Neovim plugin for the ECMA-SL (ECMAScript-like) language, featuring Tree-sitter support.

## Features

- **Tree-sitter Support**: Highly accurate syntax highlighting, indentation, and folding.
- **Vim Syntax Support**: Fallback regex-based highlighting for older Vim versions.
- **Filetype Detection**: Automatically handles `.esl` files.

## Installation

### Neovim with `nvim-treesitter` (Recommended)

Using [lazy.nvim](https://github.com/folke/lazy.nvim):

```lua
{
  "yourusername/ecmasl-vim",
  dependencies = { "nvim-treesitter/nvim-treesitter" },
  config = function()
    require("ecmasl").setup()
    -- Then run :TSInstall ecmasl
  end
}
```

Or manually with `vim-plug`:

```vim
Plug 'yourusername/ecmasl-vim'
" After install, in your init.lua:
" require('ecmasl').setup()
" Then run :TSInstall ecmasl
```

### Regular Vim

Using [vim-plug](https://github.com/junegunn/vim-plug):

```vim
Plug 'yourusername/ecmasl-vim'
```

## License

MIT
