return {
  "loctvl842/monokai-pro.nvim",
  lazy = false,
  priority = 1000,
  config = function()
    require("monokai-pro").setup({
      filter = "spectrum"
    })
    vim.cmd.colorscheme("monokai-pro")
  end,
}
