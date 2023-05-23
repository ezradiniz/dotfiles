return {
  "stevearc/oil.nvim",
  opts = {
    columns = {
      "permissions",
      "size",
      "mtime",
    },
  },
  keys = function()
    local oil = require("oil")
    return {
      { "-", oil.open, noremap = true },
    }
  end
}
