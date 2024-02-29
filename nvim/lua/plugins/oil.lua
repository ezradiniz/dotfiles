return {
  "stevearc/oil.nvim",
  opts = {
    default_file_explorer = false,
    columns = {
      "permissions",
      "size",
      "mtime",
    },
    buf_options = {
      buflisted = false,
      bufhidden = "hide",
    },
  },
  keys = function()
    local oil = require("oil")
    return {
      { "-", oil.open, noremap = true },
    }
  end,
}
