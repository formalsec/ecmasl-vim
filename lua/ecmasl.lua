local M = {}

function M.setup()
  -- Manual registration for custom parser
  local parser_config = require("nvim-treesitter.parsers").get_parser_configs()
  parser_config.ecmasl = {
    install_info = {
      url = "https://github.com/formalsec/ecmasl-vim",
      files = {"src/parser.c"},
    },
    filetype = "ecmasl",
  }

  vim.filetype.add({
    extension = {
      esl = "ecmasl", -- Change 'esl' to your actual extension
    },
  })
end

return M
