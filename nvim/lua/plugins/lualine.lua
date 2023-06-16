return {
  "nvim-lualine/lualine.nvim",
  opts = {
    options = {
      theme = "auto",
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
