return {
  "nvim-lualine/lualine.nvim",
  opts = {
    options = {
      theme = "catppuccin",
    },
  },
  config = function(_, opts)
    local lualine = require("lualine")
    lualine.setup(opts)
  end,
}
