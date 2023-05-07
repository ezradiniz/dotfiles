return {
  "Wansmer/treesj",
  keys = {
    { "gS", ":TSJSplit<CR>", noremap = true, silent = true },
    { "gJ", ":TSJJoin<CR>", noremap = true, silent = true },
    { "<Leader>gS", ":TSJToggle<CR>", noremap = true, silent = true },
  },
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
  },
  opts = {
    use_default_keymaps = false,
  },
}
