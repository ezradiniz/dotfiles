return {
  "tpope/vim-fugitive",
  cmd = "Git",
  dependencies = {
    { "tpope/vim-rhubarb" },
  },
  keys = {
    { "<Leader>G", ":Git ", noremap = true },
    { "<Leader>gs", ":Git<cr>", noremap = true, silent = true },
    { "<Leader>gps", ":Git! push", noremap = true },
    { "<Leader>gpf", ":Git! push --force-with-lease", noremap = true },
    { "<Leader>gd", ":Gdiffsplit<cr>", noremap = true, silent = true },
    { "<Leader>gf", ":Git! fetch<cr>", noremap = true, silent = true },
    { "<Leader>gmt", ":Git mergetool<cr>", noremap = true, silent = true },
    { "<Leader>gbr", ":Git branch<cr>", noremap = true, silent = true },
    { "<Leader>gbl", ":Git blame<cr>", noremap = true, silent = true },
    { "<Leader>gh", ":Git show<cr>", noremap = true, silent = true },
    { "<Leader>gvd", ":Gvdiffsplit!<cr>", noremap = true, silent = true },
    { "<Leader>gl", ":Git log --oneline --decorate --graph<cr>", noremap = true, silent = true },
    { "<Leader>0gl", ":Git log --oneline --decorate --graph %<cr>", noremap = true, silent = true },
    { "<Leader>0gcl", ":0Gclog<cr>", noremap = true, silent = true },
  },
}
