local telescope = require("telescope")
local actions = require("telescope.actions")
local actions_layout = require("telescope.actions.layout")

local opts = { noremap = true, silent = true }

vim.keymap.set("n", "<Leader>fb", ":Telescope buffers<cr>", opts)
vim.keymap.set("n", "<Leader>ff", ":Telescope find_files<cr>", opts)
vim.keymap.set("n", "<Leader>fg", ":Telescope live_grep<cr>", opts)
vim.keymap.set(
    "n",
    "<Leader>fl",
    "<CMD>lua require 'telescope'.extensions.file_browser.file_browser()<CR>",
    opts
)
vim.keymap.set("n", "q:", ":Telescope command_history<cr>", opts)
vim.keymap.set("n", "<Leader>fp", ":Telescope git_files<cr>", opts)
vim.keymap.set("n", "<space>Q", ":Telescope diagnostics<cr>", opts)
vim.keymap.set("n", "<Leader>fr", ":Telescope resume<cr>", opts)
vim.keymap.set("n", "<Leader>fh", ":Telescope help_tags<cr>", opts)
vim.keymap.set("n", "<Leader>/", ":Telescope current_buffer_fuzzy_find<cr>", opts)

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
