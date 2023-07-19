return {
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
  },
}
