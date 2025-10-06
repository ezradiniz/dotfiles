local config = {
  diagnostics = {
    eslint_d = {
      prefix = "eslint_d",
      lintCommand = "eslint_d -f unix --stdin --stdin-filename ${INPUT}",
      lintStdin = true,
      lintIgnoreExitCode = true,
      rootMarkers = {
        ".eslintrc",
        ".eslintrc.cjs",
        ".eslintrc.js",
        ".eslintrc.json",
        ".eslintrc.yaml",
        ".eslintrc.yml",
        "package.json",
      },
    },
  },
  formatting = {
    prettier_d = {
      formatCommand = "prettierd ${INPUT}",
      formatStdin = true,
    },
    stylua = {
      formatCommand = "stylua --color Never -",
      formatStdin = true,
      rootMarkers = { "stylua.toml", ".stylua.toml" },
    },
    terraform = {
      formatCommand = "terraform fmt -",
      formatStdin = true,
    },
    isort = {
      formatCommand = "isort --quiet -",
      formatStdin = true,
    },
    black = {
      formatCommand = "black --quiet -",
      formatStdin = true,
    },
  },
}

---@type vim.lsp.Config
return {
  cmd = { "efm-langserver" },
  filetypes = {
    "terraform",
    "python",
    "css",
    "lua",
    "astro",
    "javascript",
    "javascriptreact",
    "typescript",
    "typescriptreact",
  },
  root_markers = { ".git" },
  init_options = { documentFormatting = true },
  settings = {
    languages = {
      lua = { config.formatting.stylua },
      javascript = { config.diagnostics.eslint_d, config.formatting.prettier_d },
      css = { config.formatting.prettier_d },
      astro = { config.diagnostics.eslint_d, config.formatting.prettier_d },
      typescriptreact = { config.diagnostics.eslint_d, config.formatting.prettier_d },
      terraform = { config.formatting.terraform },
      python = { config.formatting.isort, config.formatting.black },
    },
  },
}
