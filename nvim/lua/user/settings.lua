local function set_globals()
    vim.g.mapleader = ","
    -- Reference: https://github.com/justinmk/config/blob/39097a1840decd6daccc340ed56e7efbc618702d/.config/nvim/lua/plugins.lua#L15
    vim.cmd([[
        let g:loaded_netrwPlugin = 0
        nnoremap <silent> <Plug>NetrwBrowseX :call netrw#BrowseX(expand((exists("g:netrw_gx")? g:netrw_gx : '<cfile>')),netrw#CheckIfRemote())<CR>
        nmap gx <Plug>NetrwBrowseX
    ]])
end

local function set_editor_options()
    vim.opt.path = vim.opt.path + ",**"
    vim.opt.compatible = false
    vim.opt.number = true
    vim.opt.relativenumber = true
    vim.opt.cursorline = true
    vim.opt.cursorcolumn = false
    vim.opt.hidden = true
    vim.opt.magic = true
    vim.opt.showmatch = true
    vim.opt.autowrite = true
    vim.opt.hlsearch = true
    vim.opt.ignorecase = true
    vim.opt.smartcase = true
    vim.opt.colorcolumn = "80"
    vim.opt.updatetime = 50
    vim.opt.history = 10000
    vim.opt.autoread = true
    vim.opt.timeout = false
    vim.opt.ttimeout = true
    vim.opt.ttimeoutlen = 0
    vim.opt.ttyfast = true
    vim.opt.signcolumn = "auto"
    vim.opt.backup = false
    vim.opt.swapfile = false
    vim.opt.wrap = false
    vim.opt.textwidth = 0
    vim.opt.eol = false
    vim.opt.list = true
    vim.opt.listchars = {
        tab = "▸ ",
        trail = "•",
        extends = "»",
        precedes = "«",
    }
    vim.opt.scrolloff = 4
    vim.opt.laststatus = 2
    vim.opt.lazyredraw = true
    vim.opt.showmode = false
    vim.opt.completeopt = "menu,menuone,noselect"
    vim.opt.switchbuf = "usetab"
    vim.opt.undofile = true
    vim.opt.undodir = vim.fn.stdpath("config") .. "/undodir"
    vim.opt.tm = 500
    vim.opt.maxmempattern = 20000
    vim.opt.inccommand = "split"
    vim.opt.autoindent = true
    vim.opt.cindent = true
    vim.opt.tabstop = 4
    vim.opt.shiftwidth = 4
    vim.opt.softtabstop = 4
    vim.opt.expandtab = true
    vim.opt.wildmode = "longest:full"
end

local function set_maps()
    local opts = { noremap = true, silent = true }

    vim.api.nvim_set_keymap("n", "<Leader><Enter>", ":noh<cr>", opts)
    vim.api.nvim_set_keymap("n", "<Leader>co", "ggVGy:tabnew<cr>:set syntax=qf<cr>pgg", opts)
    vim.api.nvim_set_keymap("n", "<Leader>cd", ":lcd %:p:h<cr>", opts)
    vim.api.nvim_set_keymap("n", "<Leader>m", "mmHmt:%s/<C-V><CR>//ge<CR>'tzt'm", opts)
    vim.api.nvim_set_keymap("n", "<Leader>e", ":silent tabnew ~/.config/nvim/init.lua<cr>:tcd %:p:h<cr>", opts)
end

set_globals()
set_editor_options()
set_maps()
