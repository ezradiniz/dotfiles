return {
  "stevearc/oil.nvim",
  opts = {
    default_file_explorer = false,
  },
  keys = function()
    local oil = require("oil")
    return {
      { "-", oil.open, noremap = true },
    }
  end,
}
