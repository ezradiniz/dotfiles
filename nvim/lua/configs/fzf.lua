local opts = {noremap = true, silent = true}

vim.api.nvim_set_keymap('n', '<c-b>', ':Buffers<cr>', opts)
vim.api.nvim_set_keymap('n', '<c-f>', ':Files<cr>', opts)
vim.api.nvim_set_keymap('n', '<c-p>', ':GFiles<cr>', opts)
vim.api.nvim_set_keymap('n', '<Leader>`', ':Marks<cr>', opts)
vim.api.nvim_set_keymap('n', 'q:', ':History:<cr>', opts)
vim.api.nvim_set_keymap('n', '<Leader>rg', ':Rg ', {noremap = true})

vim.g.fzf_buffers_jump = true
