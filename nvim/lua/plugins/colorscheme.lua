return {
  "ellisonleao/gruvbox.nvim",
  lazy = false,
  priority = 1000,
  config = function()
    require("gruvbox").setup({
      contrast = "soft",
      overrides = {
        DiffAdd = { fg = "#a1b56c", bg = "#181818", reverse = true },
        DiffChange = { fg = "#689d6a", bg = "#181818", reverse = true },
        DiffDelete = { fg = "#ab4642", bg = "#181818", reverse = true },
        DiffText = { fg = "#458588", bg = "#181818", reverse = true },
        diffAdded = { fg = "#a1b56c", bg = "#181818", reverse = true },
        diffChanged = { fg = "#689d6a", bg = "#181818", reverse = true },
        diffRemoved = { fg = "#ab4642", bg = "#181818", reverse = true },
        DiagnosticVirtualTextWarn  = { fg = "#7c6f64" },
        DiagnosticVirtualTextError = { fg = "#ab4642" },
     },
    })
    vim.opt.background = "light"
    vim.cmd.colorscheme("gruvbox")
  end,
}
