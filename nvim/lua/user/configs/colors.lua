vim.cmd("syntax enable")
vim.opt.background = "dark"
vim.cmd("colorscheme base16-classic-dark")

-- Diff highlights
vim.cmd([[
    hi DiffAdd guifg=#a1b56c guibg=#181818 gui=inverse
    hi DiffChange guifg=#689d6a guibg=#181818 gui=inverse
    hi DiffDelete guifg=#ab4642 guibg=#181818 gui=inverse
    hi DiffText guifg=#458588 guibg=#181818 gui=inverse

    hi diffAdded guifg=#a1b56c
    hi diffRemoved guifg=#ab4642
    hi diffChanged guifg=#689d6a
    hi diffNewFile guifg=#fabd2f
    hi diffLine guifg=#458588
]])
