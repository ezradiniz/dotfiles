local telescope = require('telescope')
local actions = require('telescope.actions')
local builtin = require('telescope.builtin')

local opts = {noremap = true, silent = true}

vim.api.nvim_set_keymap('n', '<C-b>', ':Telescope buffers<cr>', opts)
vim.api.nvim_set_keymap('n', '<C-f>', ':Telescope find_files<cr>', opts)
vim.api.nvim_set_keymap('n', '<C-p>',
                        '<CMD>lua require\'configs.telescope\'.project_files()<CR>',
                        opts)
vim.api.nvim_set_keymap('n', 'q:', ':Telescope command_history<cr>', opts)
vim.api.nvim_set_keymap('n', '<Leader>rg', ':Telescope live_grep<cr>', opts)

telescope.setup {
    defaults = {
        mappings = {
            i = {
                ["<esc>"] = actions.close,
                ["<C-K>"] = actions.move_selection_previous,
                ["<C-J>"] = actions.move_selection_next
            }
        }
    }
}

telescope.load_extension('fzf')

-- TODO: remove module
local M = {}

M.project_files = function()
    local ok = pcall(builtin.git_files, opts)
    if not ok then builtin.find_files(opts) end
end

return M
