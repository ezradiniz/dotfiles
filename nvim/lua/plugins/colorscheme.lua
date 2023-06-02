return {
  "catppuccin/nvim",
  name = "catppuccin",
  lazy = false,
  priority = 1000,
  config = function()
    require("catppuccin").setup({
      flavour = "mocha",
      term_colors = true,
      transparent_background = false,
      no_italic = false,
      no_bold = false,
      color_overrides = {
        mocha = {
          base = "#181818",
          -- NOTE(temporarily): This fixes background colors for other plugins
          mantle = "#181818",
        },
      },
      highlight_overrides = {
        all = function(_)
          return {
            Search = { fg = "#181818", bg = "#f9e2af" },
            IncSearch = { bg = "#f1fa6a" },
          }
        end,
      },
      integrations = {
        cmp = true,
        treesitter = true,
        gitsigns = true,
        telescope = true,
        native_lsp = {
          enabled = true,
        },
      },
    })
    vim.cmd.colorscheme("catppuccin")
  end,
}
