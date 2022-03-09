require("nvim-treesitter.configs").setup({
    highlight = {
        enable = true,
        additional_vim_regex_highlighting = true,
    },
    autopairs = {
        enable = true,
    },
    incremental_selection = { enable = true },
    textobjects = { enable = true },
})
