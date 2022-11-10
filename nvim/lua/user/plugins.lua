local fn = vim.fn
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"

if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({
        "git",
        "clone",
        "https://github.com/wbthomason/packer.nvim",
        install_path,
    })
    vim.api.nvim_command("packadd packer.nvim")
end

vim.cmd([[packadd packer.nvim]])

return require("packer").startup(function()
    -- Packer can manage itself
    use("wbthomason/packer.nvim")

    use({
        "justinmk/vim-dirvish",
        config = function()
            require("user.configs.dirvish")
        end,
    })

    use("AndrewRadev/splitjoin.vim")

    use({ "nvim-telescope/telescope-file-browser.nvim" })
    use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make" })
    use({
        "nvim-telescope/telescope.nvim",
        requires = { "nvim-lua/plenary.nvim" },
        config = function()
            require("user.configs.telescope")
        end,
    })

    use({
        "nvim-treesitter/nvim-treesitter",
        run = ":TSUpdate",
        config = function()
            require("user.configs.treesitter")
        end,
    })
    use({
        "https://gitlab.com/madyanov/gruber.vim",
        config = function()
            require("user.configs.colors")
        end,
    })

    use({
        "lewis6991/gitsigns.nvim",
        requires = { "nvim-lua/plenary.nvim" },
        config = function()
            require("user.configs.gitsigns")
        end,
    })
    use({
        "neovim/nvim-lspconfig",
        requires = { "folke/neodev.nvim" },
        config = function()
            require("user.configs.lsp")
        end,
    })
    use("sheerun/vim-polyglot")
    use("tpope/vim-dispatch")
    use("tpope/vim-git")
    use({
        "tpope/vim-fugitive",
        config = function()
            require("user.configs.fugitive")
        end,
        requires = { "tpope/vim-rhubarb" },
    })
    use("tpope/vim-repeat")
    use("tpope/vim-sleuth")
    use("tpope/vim-surround")
    use("tpope/vim-unimpaired")
    use("tpope/vim-eunuch")
    use("tpope/vim-commentary")

    use({
        "ray-x/go.nvim",
        run = ":GoInstallBinaries",
        config = function()
            require("user.configs.go-nvim")
        end,
    })

    use({
        "jose-elias-alvarez/null-ls.nvim",
        requires = { "nvim-lua/plenary.nvim" },
        config = function()
            require("user.configs.null-ls")
        end,
    })

    use({
        "hrsh7th/nvim-cmp",
        config = function()
            require("user.configs.cmp")
        end,
    })
    use("hrsh7th/cmp-nvim-lsp")
    use("hrsh7th/cmp-buffer")
    use("hrsh7th/cmp-path")
    use("hrsh7th/cmp-cmdline")

    use("saadparwaiz1/cmp_luasnip")
    use("L3MON4D3/LuaSnip")

    use({ "ellisonleao/glow.nvim" })

    use({
        "lukas-reineke/indent-blankline.nvim",
        config = function()
            require("user.configs.indent-blankline")
        end,
    })
end)
