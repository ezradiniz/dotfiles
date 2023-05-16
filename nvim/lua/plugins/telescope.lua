return {
  "nvim-telescope/telescope.nvim",
  version = false,
  dependencies = {
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    { "nvim-telescope/telescope-ui-select.nvim" },
    { "nvim-lua/plenary.nvim" },
    { "molecule-man/telescope-menufacture" },
  },
  keys = function()
    return {
      {
        "<Leader>fb",
        function()
          require("telescope.builtin").buffers()
        end,
      },
      {
        "<Leader>fg",
        function()
          require("telescope").extensions.menufacture.live_grep()
        end,
      },
      {
        "<Leader>Q",
        function()
          require("telescope.builtin").diagnostics()
        end,
      },
      {
        "<Leader>fr",
        function()
          require("telescope.builtin").resume()
        end,
      },
      {
        "<Leader>fh",
        function()
          require("telescope.builtin").help_tags()
        end,
      },
      {
        "<Leader>/",
        function()
          require("telescope.builtin").current_buffer_fuzzy_find()
        end,
      },
      {
        "q:",
        function()
          require("telescope.builtin").command_history()
        end,
      },
      {
        "<Leader>fm",
        function()
          require("telescope.builtin").marks()
        end,
      },
      {
        "<Leader>fp",
        function()
          require("telescope").extensions.menufacture.find_files()
        end,
      },
      {
        "<Leader>fo",
        function()
          require("telescope.builtin").oldfiles()
        end,
      },
    }
  end,
  opts = function()
    local actions = require("telescope.actions")
    local actions_layout = require("telescope.actions.layout")
    return {
      defaults = {
        layout_strategy = "bottom_pane",
        layout_config = {
          prompt_position = "bottom",
        },
        preview = {
          hide_on_startup = true,
        },
        mappings = {
          i = {
            ["<ESC>"] = actions.close,
            ["<C-K>"] = actions.move_selection_previous,
            ["<C-J>"] = actions.move_selection_next,
            ["<C-P>"] = actions_layout.toggle_preview,
          },
        },
      },
      extensions = {
        menufacture = {
          mappings = {
            main_menu = { [{ "i", "n" }] = "?" },
          },
        },
      },
    }
  end,
  config = function(_, opts)
    local telescope = require("telescope")
    telescope.setup(opts)
    telescope.load_extension("fzf")
    telescope.load_extension("ui-select")
    telescope.load_extension("menufacture")
  end,
}
