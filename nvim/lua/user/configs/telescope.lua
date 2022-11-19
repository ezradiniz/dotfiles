local telescope = require("telescope")
local actions = require("telescope.actions")
local actions_layout = require("telescope.actions.layout")
local builtin = require("telescope.builtin")

local opts = { noremap = true, silent = true }

vim.keymap.set("n", "<Leader>fb", builtin.buffers, opts)
vim.keymap.set("n", "<Leader>fg", builtin.live_grep, opts)
vim.keymap.set("n", "<Leader>fp", builtin.git_files, opts)
vim.keymap.set("n", "<space>Q", builtin.diagnostics, opts)
vim.keymap.set("n", "<Leader>fr", builtin.resume, opts)
vim.keymap.set("n", "<Leader>fh", builtin.help_tags, opts)
vim.keymap.set("n", "<Leader>/", builtin.current_buffer_fuzzy_find, opts)
vim.keymap.set("n", "q:", builtin.command_history, opts)
vim.keymap.set("n", "<Leader>ff", function()
    builtin.find_files({ find_command = { "rg", "--files", "--hidden", "--smart-case", "--glob=!.git" } })
end, opts)

telescope.setup({
    defaults = {
        mappings = {
            i = {
                ["<ESC>"] = actions.close,
                ["<C-K>"] = actions.move_selection_previous,
                ["<C-J>"] = actions.move_selection_next,
                ["?"] = actions_layout.toggle_preview,
            },
        },
    },
})

telescope.load_extension("fzf")
telescope.load_extension("file_browser")
