local M = {}

function M.setup()
  -- For NixOS users, the parser should be available in the runtime path.
  -- We just need to tell nvim-treesitter to use it.
  require("nvim-treesitter.parsers").get_parser_configs().ecmasl = {
    filetype = "esl",
  }
end

return M
