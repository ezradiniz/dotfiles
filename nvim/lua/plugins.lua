local fn = vim.fn
local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({
        'git', 'clone', 'https://github.com/wbthomason/packer.nvim',
        install_path
    })
    vim.api.nvim_command 'packadd packer.nvim'
end

vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function()
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    use {
        'justinmk/vim-dirvish',
        config = function() require("configs.dirvish") end
    }

    use 'AndrewRadev/splitjoin.vim'
    use 'cohama/lexima.vim'
    use {
        'hrsh7th/nvim-compe',
        config = function() require("configs.compe") end,
        event = "InsertEnter"
    }
    use {'junegunn/fzf', run = ":call fzf#install()"}
    use {'junegunn/fzf.vim', config = function() require("configs.fzf") end}

    use {
        'kkga/vim-envy',
        lock = true,
        commit = '9d0a61d149e5a59cdc61232a3ed594e4f98f3bf9'
    }

    use 'mhinz/vim-signify'
    use {
        'neovim/nvim-lspconfig',
        config = function() require("configs.lsp") end
    }
    use 'sheerun/vim-polyglot'
    use 'terryma/vim-expand-region'
    use 'tpope/vim-commentary'
    use 'tpope/vim-dispatch'
    use {
        'tpope/vim-fugitive',
        config = function() require("configs.fugitive") end,
        requires = {"tpope/vim-rhubarb"}
    }
    use 'tpope/vim-git'
    use 'tpope/vim-repeat'
    use 'tpope/vim-sleuth'
    use 'tpope/vim-surround'
    use 'tpope/vim-unimpaired'

    use {
        'mattn/efm-langserver',
        requires = {"neovim/nvim-lspconfig"},
        config = function() require("configs.efm") end
    }
end)
