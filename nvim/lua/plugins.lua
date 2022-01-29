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

    use {"nvim-telescope/telescope-file-browser.nvim"}
    use {'nvim-telescope/telescope-fzf-native.nvim', run = 'make'}
    use {
        'nvim-telescope/telescope.nvim',
        requires = {'nvim-lua/plenary.nvim'},
        config = function() require("configs.telescope") end
    }

    use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate',
        config = function() require("configs.treesitter") end
    }
    use {
        'RRethy/nvim-base16',
        config = function() require("configs.colors") end
    }

    use {
        'lewis6991/gitsigns.nvim',
        requires = {'nvim-lua/plenary.nvim'},
        config = function() require('configs.gitsigns') end
    }
    use {
        'neovim/nvim-lspconfig',
        config = function() require("configs.lsp") end
    }
    use 'sheerun/vim-polyglot'
    use 'tpope/vim-dispatch'
    use 'tpope/vim-git'
    use {
        'tpope/vim-fugitive',
        config = function() require("configs.fugitive") end,
        requires = {"tpope/vim-rhubarb"}
    }
    use 'tpope/vim-repeat'
    use 'tpope/vim-sleuth'
    use 'tpope/vim-surround'
    use 'tpope/vim-unimpaired'
    use 'tpope/vim-eunuch'

    use {
        'fatih/vim-go',
        run = ':GoInstallBinaries',
        config = function() require("configs.vim-go") end
    }

    use {
        'mattn/efm-langserver',
        requires = {"neovim/nvim-lspconfig"},
        config = function() require("configs.efm") end
    }

    use {'hrsh7th/nvim-cmp', config = function() require("configs.cmp") end}
    use 'hrsh7th/cmp-nvim-lsp'
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/cmp-path'
    use 'hrsh7th/cmp-cmdline'

    use 'saadparwaiz1/cmp_luasnip'
    use 'L3MON4D3/LuaSnip'

    use {
        'numToStr/Comment.nvim',
        config = function() require('Comment').setup() end
    }
end)
