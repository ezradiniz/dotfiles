return {
  "ellisonleao/gruvbox.nvim",
  lazy = false,
  priority = 1000,
  config = function()
    -- TODO: Create new theme based on gruvbox and acme
    require("gruvbox").setup({
      contrast = "soft",
      palette_overrides = {
        light0_soft = "#ffffd7",
      },
      overrides = {
        DiffAdd = { fg = "#a1b56c", bg = "#181818", reverse = true },
        DiffChange = { fg = "#689d6a", bg = "#181818", reverse = true },
        DiffDelete = { fg = "#ab4642", bg = "#181818", reverse = true },
        DiffText = { fg = "#458588", bg = "#181818", reverse = true },
        diffAdded = { fg = "#a1b56c", bg = "#181818", reverse = true },
        diffChanged = { fg = "#689d6a", bg = "#181818", reverse = true },
        diffRemoved = { fg = "#ab4642", bg = "#181818", reverse = true },
        DiagnosticVirtualTextWarn = { fg = "#7c6f64" },
        DiagnosticVirtualTextError = { fg = "#ab4642" },

        Normal = { fg = "#000000", bg = "#ffffea" },
        Constant = { fg = "", bg = "" },
        Statement = { fg = "", bg = "" },
        Identifier = { fg = "", bg = "" },
        Ignore = { fg = "", bg = "" },
        Delimiter = { fg = "", bg = "" },
        String = { fg = "#005500", bg = "" },
        Visual = { bg = "#ffffaf" },
        Type = { fg = "#004488", bg = "" },
        StatusLine = { fg = "", bg = "#eaeaea" },
        StatusLineNC = { fg = "", bg = "#F9F5D7" },
        CursorLineNr = { fg = "", bg = "", bold = true },
        CursorLine = { fg = "", bg = "" },
        ColorColumn = { fg = "", bg = "#F9F5D7" },
        SignColumn = { fg = "", bg = "#F9F5D7" },
      },
    })
    vim.opt.background = "light"
    vim.cmd.colorscheme("gruvbox")
  end,
}
