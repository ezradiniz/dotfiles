local opts = { noremap = true, silent = true }


vim.keymap.set("n", "<Leader>G", ":Git ", { noremap = true })
vim.keymap.set("n", "<Leader>gs", ":Git<cr>", opts)
vim.keymap.set("n", "<Leader>gps", ":Gpush", { noremap = true })
vim.keymap.set("n", "<Leader>gpf", ":Gpush --force-with-lease", { noremap = true })
vim.keymap.set("n", "<Leader>gd", ":Gdiff<cr>", opts)
vim.keymap.set("n", "<Leader>gf", ":Gfetch<cr>", opts)
vim.keymap.set("n", "<Leader>gmt", ":Git mergetool<cr>", opts)
vim.keymap.set("n", "<Leader>gbr", ":Git branch<cr>", opts)
vim.keymap.set("n", "<Leader>gbl", ":Git blame<cr>", opts)
vim.keymap.set("n", "<Leader>gh", ":Git show<cr>", opts)
vim.keymap.set("n", "<Leader>gvd", ":Gvdiffsplit!<cr>", opts)
vim.keymap.set("n", "<Leader>gl", ":Git log --oneline --decorate --graph<cr>", opts)
vim.keymap.set("n", "<Leader>0gl", ":Git log --oneline --decorate --graph %<cr>", opts)
vim.keymap.set("n", "<Leader>0gcl", ":0Gclog<cr>", opts)

vim.cmd(
    [[ command! -bang -bar -nargs=* Gpush execute 'Dispatch<bang> -dir=' . fnameescape(FugitiveGitDir()) 'git push' <q-args> ]]
)
vim.cmd(
    [[ command! -bang -bar -nargs=* Gfetch execute 'Dispatch<bang> -dir=' . fnameescape(FugitiveGitDir()) 'git fetch --prune' <q-args> ]]
)
