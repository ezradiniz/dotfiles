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
        all = function(colors)
          return {
            Comment = { fg = colors.overlay1 },
            LineNr = { fg = colors.overlay1 },
            Search = { fg = "#181818", bg = "#f9e2af" },
            DiffAdd = { fg = "#a1b56c", bg = "#181818", reverse = true },
            DiffChange = { fg = "#689d6a", bg = "#181818", reverse = true },
            DiffDelete = { fg = "#ab4642", bg = "#181818", reverse = true },
            DiffText = { fg = "#458588", bg = "#181818", reverse = true },
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
