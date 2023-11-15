return {
  "ibhagwan/fzf-lua",
  cmd = "FzfLua",
  keys = {
    { "<leader>fm", "<cmd>FzfLua help_tags<cr>" },
    { "<leader>fm", "<cmd>FzfLua marks<cr>" },
    { "<leader>Q", "<cmd>FzfLua lsp_document_diagnostics<cr>" },
    { "<leader>fg", "<cmd>FzfLua live_grep_glob<cr>" },
    { "<leader>fg", "<cmd>FzfLua grep_visual<cr>", mode = "x" },
    { "<leader>fp", "<cmd>FzfLua files<cr>" },
    { "<leader>fb", "<cmd>FzfLua buffers<cr>" },
    { "<leader>fo", "<cmd>FzfLua oldfiles<cr>" },
    { "<leader>fr", "<cmd>FzfLua resume<cr>" },
    { "<leader>/", "<cmd>FzfLua lgrep_curbuf<cr>" },
  },
  opts = function()
    local actions = require("fzf-lua.actions")

    return {
      winopts = {
        preview = {
          scrollbar = false,
          layout = "vertical",
          vertical = "up:30%",
        },
        on_create = function()
          -- Reference: https://github.com/ibhagwan/fzf-lua/issues/808#issuecomment-1620961060
          vim.keymap.set("t", "<C-r>", [['<C-\><C-N>"'.nr2char(getchar()).'pi']], { expr = true, buffer = true })
        end
      },
      files = {
        winopts = {
          preview = { hidden = "hidden" },
        },
        actions = {
          ["ctrl-g"] = actions.toggle_ignore,
        },
      },
      oldfiles = {
        include_current_session = true,
        winopts = {
          preview = { hidden = "hidden" },
        },
      },
    }
  end,
}
