local opts = {noremap = true, silent = true}

vim.api.nvim_set_keymap('n', '<C-b>', ':Telescope buffers<cr>', opts)
vim.api.nvim_set_keymap('n', '<C-f>', ':Telescope find_files<cr>', opts)
vim.api.nvim_set_keymap('n', '<C-p>', ':Telescope git_files<cr>', opts)
vim.api.nvim_set_keymap('n', 'q:', ':Telescope command_history<cr>', opts)
vim.api.nvim_set_keymap('n', '<Leader>rg', ':Telescope live_grep<cr>', opts)

require('telescope').load_extension('fzf')
