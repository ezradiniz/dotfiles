return {
  "nvim-telescope/telescope.nvim",
  version = false,
  dependencies = {
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    { "nvim-telescope/telescope-ui-select.nvim" },
    { "nvim-lua/plenary.nvim" },
  },
  keys = function()
    local function find_files()
      require("telescope.builtin").find_files({
        find_command = { "rg", "--files", "--hidden", "--smart-case", "--glob=!.git" },
      })
    end

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
          require("telescope.builtin").live_grep()
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
      },
      {
        "<Leader>fl",
        find_files,
      },
      {
        "<Leader>fp",
        function()
          local ok, _ = pcall(require("telescope.builtin").git_files)
          if not ok then
            find_files()
          end
        end,
      },
    }
  end,
  opts = function()
    local actions = require("telescope.actions")
    local actions_layout = require("telescope.actions.layout")
    return {
      defaults = {
        preview = {
          hide_on_startup = true,
        },
        mappings = {
          i = {
            ["<ESC>"] = actions.close,
            ["<C-K>"] = actions.move_selection_previous,
            ["<C-J>"] = actions.move_selection_next,
            ["?"] = actions_layout.toggle_preview,
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
  end,
}
