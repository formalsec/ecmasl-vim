local M = {}

function M.setup()
  -- Register the filetype
  vim.filetype.add({
    extension = {
      esl = "ecmasl",
    },
  })

  -- Native Neovim registration for the parser (Nvim 0.10+)
  if vim.treesitter.language.add then
    vim.treesitter.language.add("ecmasl", { filetype = "ecmasl" })
  end

  -- nvim-treesitter integration (for :TSInstall and management)
  -- Note: Neovim 0.12+ uses the 'main' branch of nvim-treesitter
  local status_ok, parsers = pcall(require, "nvim-treesitter.parsers")
  if status_ok then
    local parser_config = parsers.get_parser_configs()
    parser_config.ecmasl = {
      install_info = {
        url = "https://github.com/formalsec/ecmasl-vim",
        files = { "tree-sitter-ecmasl/src/parser.c" },
        -- Optional: branch = "main",
      },
      filetype = "ecmasl",
    }
  end
end

return M
