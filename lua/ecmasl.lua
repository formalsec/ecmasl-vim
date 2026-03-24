local M = {}

function M.setup()
  local parser_config = require("nvim-treesitter.parsers").get_parser_configs()

  -- Check if already registered
  if not parser_config.ecmasl then
    parser_config.ecmasl = {
      install_info = {
        url = "https://github.com/formalsec/ecmasl-vim", -- User should replace this or we use local path
        files = { "tree-sitter-ecmasl/src/parser.c" },
        branch = "main",
      },
      filetype = "esl",
    }
  end

  -- We can also force a local path if we want it to work immediately after cloning
  -- but usually it's better to let nvim-treesitter handle the download/compile.
end

return M
