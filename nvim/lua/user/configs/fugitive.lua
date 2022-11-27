local opts = { noremap = true, silent = true }

vim.keymap.set("n", "<Leader>G", ":Git ", { noremap = true })
vim.keymap.set("n", "<Leader>gs", ":Git<cr>", opts)
vim.keymap.set("n", "<Leader>gps", ":Git! push", opts)
vim.keymap.set("n", "<Leader>gpf", ":Git! push --force-with-lease", opts)
vim.keymap.set("n", "<Leader>gd", ":Gdiffsplit<cr>", opts)
vim.keymap.set("n", "<Leader>gf", ":Git! fetch<cr>", opts)
vim.keymap.set("n", "<Leader>gmt", ":Git mergetool<cr>", opts)
vim.keymap.set("n", "<Leader>gbr", ":Git branch<cr>", opts)
vim.keymap.set("n", "<Leader>gbl", ":Git blame<cr>", opts)
vim.keymap.set("n", "<Leader>gh", ":Git show<cr>", opts)
vim.keymap.set("n", "<Leader>gvd", ":Gvdiffsplit!<cr>", opts)
vim.keymap.set("n", "<Leader>gl", ":Git log --oneline --decorate --graph<cr>", opts)
vim.keymap.set("n", "<Leader>0gl", ":Git log --oneline --decorate --graph %<cr>", opts)
vim.keymap.set("n", "<Leader>0gcl", ":0Gclog<cr>", opts)
