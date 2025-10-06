return {
  "nvim-lualine/lualine.nvim",
  opts = {
    options = {
      theme = "auto",
      component_separators = "",
      section_separators = "",
      icons_enabled = false,
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
    inactive_sections = {
      lualine_c = {
        "%=",
        {
          "filename",
          file_status = true,
          path = 1,
        },
      },
      lualine_x = { "location" },
    },
  },
}
