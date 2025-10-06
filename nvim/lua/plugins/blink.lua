return {
  "saghen/blink.cmp",
  event = "InsertEnter",
  build = "cargo +nightly build --release",
  version = "*",
  opts = {
    keymap = {
      ["<CR>"] = { "accept", "fallback" },
      ["<C-\\>"] = { "hide", "fallback" },
      ["<C-n>"] = { "select_next", "show" },
      ["<Tab>"] = { "select_next", "snippet_forward", "fallback" },
      ["<S-Tab>"] = { "select_prev" },
      ["<C-p>"] = { "select_prev" },
      ["<C-b>"] = { "scroll_documentation_up", "fallback" },
      ["<C-f>"] = { "scroll_documentation_down", "fallback" },
    },
    signature = { enabled = true },
    completion = {
      accept = { auto_brackets = { enabled = false } },
      documentation = { auto_show = true },
      ghost_text = { enabled = false },
    },
    sources = {
      default = { "lsp", "buffer", "path" },
    },
    fuzzy = { implementation = "prefer_rust_with_warning" },
    cmdline = { enabled = true },
  },
  config = function(_, opts)
    require("blink.cmp").setup(opts)
    -- Extend neovim's client capabilities with the completion ones.
    vim.lsp.config("*", {
      root_markers = { ".git" },
      capabilities = require("blink.cmp").get_lsp_capabilities(nil, true),
    })
  end,
}
