return {
  "RRethy/base16-nvim",
  lazy = false,
  priority = 1000,
  config = function()
    vim.opt.background = "dark"
    vim.cmd.colorscheme("base16-default-dark")
    vim.api.nvim_set_hl(0, "DiffAdd", { fg = "#a1b56c", bg = "#181818", reverse = true })
    vim.api.nvim_set_hl(0, "DiffChange", { fg = "#689d6a", bg = "#181818", reverse = true })
    vim.api.nvim_set_hl(0, "DiffDelete", { fg = "#ab4642", bg = "#181818", reverse = true })
    vim.api.nvim_set_hl(0, "DiffText", { fg = "#458588", bg = "#181818", reverse = true })
    vim.api.nvim_set_hl(0, "diffAdded", { fg = "#a1b56c" })
    vim.api.nvim_set_hl(0, "diffChanged", { fg = "#689d6a" })
    vim.api.nvim_set_hl(0, "diffNewFile", { fg = "#fabd2f" })
    vim.api.nvim_set_hl(0, "diffLine", { fg = "#458588" })
  end,
}
