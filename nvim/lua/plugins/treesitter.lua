return {
  "nvim-treesitter/nvim-treesitter",
  version = false, -- last release is way too old and doesn't work on Windows
  build = ":TSUpdate",
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
      "zig",
    },
    auto_install = true,
    highlight = {
      enable = true,
      disable = function(_, buf)
        local max_filesize = 500 * 1024 -- 500 KB
        local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
        if ok and stats and stats.size > max_filesize then
          return true
        end
      end,
      additional_vim_regex_highlighting = false,
    },
    indent = { enable = true },
  },
  config = function(_, opts)
    require("nvim-treesitter.configs").setup(opts)
  end,
}
