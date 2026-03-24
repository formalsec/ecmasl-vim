# ECMA-SL Syntax Highlighting for Vim

Vim plugin for the ECMA-SL (ECMAScript-like) language.

## Features

- Full syntax highlighting for:
  - Keywords (`if`, `else`, `while`, `function`, etc.)
  - Booleans and constants
  - Strings with escape sequences
  - Numbers (integers, floats, hex, octal, binary)
  - Comments (single-line `//` and multi-line `/* */`)
  - Type annotations
  - Function calls and declarations
  - Operators (`+`, `-`, `*`, `/`, `==`, `!=`, etc.)
  - Standard library functions
- Filetype detection (`*.esl`)
- Proper `commentstring` and `iskeyword` settings
- Syntax syncing for better performance in large files

## Installation

Using [vim-plug](https://github.com/junegunn/vim-plug):

```vim
Plug 'username/ecmasl-vim'
```

## License

MIT
