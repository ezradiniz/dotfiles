return {
  "nvim-treesitter/nvim-treesitter",
  version = false, -- last release is way too old and doesn't work on Windows
  build = ":TSUpdate",
  event = "BufReadPost",
  opts = {
    ensure_installed = {
        "dockerfile",
        "javascript",
        "typescript",
        "gitcommit",
        "tsx",
        "python",
        "c",
        "go",
        "gomod",
        "bash",
        "make",
        "markdown",
        "sql",
        "vim",
        "yaml",
        "html",
        "hcl",
        "lua",
    },
    auto_install = true,
    highlight = {
        enable = true,
        disable = function(_, buf)
            local max_filesize = 100 * 1024 -- 100 KB
            local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
            if ok and stats and stats.size > max_filesize then
                return true
            end
        end,
        additional_vim_regex_highlighting = false,
    },
    autopairs = { enable = true },
    incremental_selection = { enable = true },
    textobjects = { enable = true },
    indent = { enable = true },
  },
  config = function(plugin, opts)
    if plugin.ensure_installed then
      require("lazyvim.util").deprecate("treesitter.ensure_installed", "treesitter.opts.ensure_installed")
    end
    require("nvim-treesitter.configs").setup(opts)
  end,
}
