return {
  "stevearc/oil.nvim",
  opts = {
    columns = {
      "permissions",
      "size",
    },
    default_file_explorer = false,
  },
  keys = function()
    local oil = require("oil")
    return {
      { "-", oil.open, noremap = true },
    }
  end,
}
