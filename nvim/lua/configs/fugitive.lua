local opts = {noremap = true, silent = true}

vim.g.fugitive_pty = false

vim.api.nvim_set_keymap('n', '<Leader>G', ':Git ', {noremap = true})
vim.api.nvim_set_keymap('n', '<Leader>gs', ':Git<cr>', opts)
vim.api.nvim_set_keymap('n', '<Leader>gps', ':Gpush<cr>', opts)
vim.api.nvim_set_keymap('n', '<Leader>gpf', ':Gpush --force-with-lease<cr>', opts)
vim.api.nvim_set_keymap('n', '<Leader>gd', ':Gdiff<cr>', opts)
vim.api.nvim_set_keymap('n', '<Leader>gf', ':Gfetch<cr>', opts)
vim.api.nvim_set_keymap('n', '<Leader>gmt', ':Git mergetool<cr>', opts)
vim.api.nvim_set_keymap('n', '<Leader>gbr', ':Git branch<cr>', opts)
vim.api.nvim_set_keymap('n', '<Leader>gbl', ':Git blame<cr>', opts)
vim.api.nvim_set_keymap('n', '<Leader>gh', ':Git show<cr>', opts)
vim.api.nvim_set_keymap('n', '<Leader>gvd', ':Gvdiffsplit!<cr>', opts)
vim.api.nvim_set_keymap('n', '<Leader>gl', ':Git log --oneline --decorate --graph<cr>', opts)
vim.api.nvim_set_keymap('n', '<Leader>0gl', ':Git log --oneline --decorate --graph %<cr>', opts)

vim.cmd(
    [[ command! -bang -bar -nargs=* Gpush execute 'Dispatch<bang> -dir=' . fnameescape(FugitiveGitDir()) 'git push' <q-args> ]])
vim.cmd(
    [[ command! -bang -bar -nargs=* Gfetch execute 'Dispatch<bang> -dir=' . fnameescape(FugitiveGitDir()) 'git fetch --prune' <q-args> ]])
