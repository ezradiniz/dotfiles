return {
  "ellisonleao/gruvbox.nvim",
  lazy = false,
  priority = 1000,
  config = function()
    require("gruvbox").setup({
      contrast = "hard",
      overrides = {
        DiffAdd  = { fg = "#a1b56c", bg = "#181818", reverse =  true },
        DiffChange  = { fg = "#689d6a", bg = "#181818", reverse =  true },
        DiffDelete  = { fg = "#ab4642", bg = "#181818", reverse =  true },
        diffAdded = { fg = "#a1b56c", bg = "#181818", reverse =  true },
        diffChanged = { fg = "#689d6a", bg = "#181818", reverse =  true },
        diffRemoved = { fg = "#ab4642", bg = "#181818", reverse =  true },
      }
    })
    vim.opt.background = "light"
    vim.cmd.colorscheme("gruvbox")
  end,
}
