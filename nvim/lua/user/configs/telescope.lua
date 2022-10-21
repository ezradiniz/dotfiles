local telescope = require("telescope")
local actions = require("telescope.actions")
local actions_layout = require("telescope.actions.layout")

local opts = { noremap = true, silent = true }

vim.api.nvim_set_keymap("n", "<Leader>fb", ":Telescope buffers<cr>", opts)
vim.api.nvim_set_keymap("n", "<Leader>ff", ":Telescope find_files<cr>", opts)
vim.api.nvim_set_keymap("n", "<Leader>fg", ":Telescope live_grep<cr>", opts)
vim.api.nvim_set_keymap(
    "n",
    "<Leader>fl",
    "<CMD>lua require 'telescope'.extensions.file_browser.file_browser()<CR>",
    opts
)
vim.api.nvim_set_keymap("n", "q:", ":Telescope command_history<cr>", opts)
vim.api.nvim_set_keymap("n", "<Leader>fp", ":Telescope git_files<cr>", opts)
vim.api.nvim_set_keymap("n", "<space>Q", ":Telescope diagnostics<cr>", opts)
vim.api.nvim_set_keymap("n", "<Leader>fr", ":Telescope resume<cr>", opts)
vim.api.nvim_set_keymap("n", "<Leader>fh", ":Telescope help_tags<cr>", opts)

telescope.setup({
    defaults = {
        vimgrep_arguments = {
            "rg",
            "--color=never",
            "--no-heading",
            "--with-filename",
            "--line-number",
            "--column",
            "--smart-case",
            "--hidden",
            "--glob=!.git",
        },
        mappings = {
            i = {
                ["<ESC>"] = actions.close,
                ["<C-K>"] = actions.move_selection_previous,
                ["<C-J>"] = actions.move_selection_next,
                ["?"] = actions_layout.toggle_preview,
            },
        },
        sorting_strategy = "ascending",
        layout_strategy = "bottom_pane",
        layout_config = { prompt_position = "top" },
    },
})

telescope.load_extension("fzf")
telescope.load_extension("file_browser")
