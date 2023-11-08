return {
  "ibhagwan/fzf-lua",
  cmd = "FzfLua",
  keys = {
    { "<leader>fm", "<cmd>FzfLua help_tags<cr>" },
    { "<leader>fm", "<cmd>FzfLua marks<cr>" },
    { "<leader>Q", "<cmd>FzfLua lsp_document_diagnostics<cr>" },
    { "<leader>fg", "<cmd>FzfLua grep<cr>" },
    { "<leader>fp", "<cmd>FzfLua files<cr>" },
    { "<leader>fb", "<cmd>FzfLua buffers<cr>" },
    { "<leader>fo", "<cmd>FzfLua oldfiles<cr>" },
    { "<leader>fr", "<cmd>FzfLua resume<cr>" },
    { "<leader>/", "<cmd>FzfLua lgrep_curbuf<cr>" },
  },
}
