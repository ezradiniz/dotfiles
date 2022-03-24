vim.cmd("syntax enable")
vim.opt.termguicolors = true

-- Example config in Lua
require("github-theme").setup({
    theme_style = "light",
    hide_inactive_statusline = false,
})
