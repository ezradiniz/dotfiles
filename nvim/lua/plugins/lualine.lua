return {
  "nvim-lualine/lualine.nvim",
  opts = {
    options = {
      theme = "catppuccin",
      component_separators = "",
      section_separators = "",
    },
    sections = {
      lualine_c = {
        "%=",
        {
          "filename",
          file_status = true,
          path = 1,
        },
      },
    },
  },
}
