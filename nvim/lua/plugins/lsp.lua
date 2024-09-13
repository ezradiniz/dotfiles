local on_attach = function(_, bufnr)
  if vim.api.nvim_buf_get_name(bufnr):match("^%a+://") then
    return
  end

  -- Enable completion triggered by <c-x><c-o>
  vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")

  -- Mappings.
  local bufopts = { noremap = true, silent = true, buffer = bufnr }

  -- See `:help vim.lsp.*` for documentation on any of the below functions
  vim.keymap.set("n", "gD", vim.lsp.buf.declaration, bufopts)
  vim.keymap.set("n", "gd", vim.lsp.buf.definition, bufopts)
  vim.keymap.set("n", "K", vim.lsp.buf.hover, bufopts)
  vim.keymap.set("n", "gi", vim.lsp.buf.implementation, bufopts)
  vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, bufopts)
  vim.keymap.set("n", "<space>wa", vim.lsp.buf.add_workspace_folder, bufopts)
  vim.keymap.set("n", "<space>wr", vim.lsp.buf.remove_workspace_folder, bufopts)
  vim.keymap.set("n", "<space>wl", function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, bufopts)
  vim.keymap.set("n", "<space>D", vim.lsp.buf.type_definition, bufopts)
  vim.keymap.set("n", "<space>rn", vim.lsp.buf.rename, bufopts)
  vim.keymap.set("n", "<space>ca", vim.lsp.buf.code_action, bufopts)
  vim.keymap.set("n", "gr", vim.lsp.buf.references, bufopts)
  vim.keymap.set("n", "<space>f", function()
    vim.lsp.buf.format({ async = true })
  end, bufopts)

  local opts = { noremap = true, silent = true }
  vim.keymap.set("n", "<space>e", vim.diagnostic.open_float, opts)
  vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)
  vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts)
  vim.keymap.set("n", "<space>q", vim.diagnostic.setloclist, opts)
end

return {
  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "folke/neodev.nvim",
      "mattn/efm-langserver",
    },
    config = function()
      local nvim_lsp = require("lspconfig")
      local cmp_nvim_lsp = require("cmp_nvim_lsp")
      local efm = require("config.efm")

      vim.diagnostic.config({
        severity_sort = true,
        virtual_text = true,
        float = {
          focusable = false,
          style = "minimal",
          border = "rounded",
          source = "always",
          header = "",
          prefix = "",
        },
      })

      vim.lsp.handlers["textDocument/hover"] =
        vim.lsp.with(vim.lsp.handlers.hover, { border = "rounded", focusable = false })

      local capabilities = cmp_nvim_lsp.default_capabilities(vim.lsp.protocol.make_client_capabilities())

      nvim_lsp["ts_ls"].setup({
        on_attach = on_attach,
        capabilities = capabilities,
      })

      nvim_lsp["astro"].setup({
        on_attach = on_attach,
        capabilities = capabilities,
      })

      nvim_lsp["gopls"].setup({
        on_attach = on_attach,
        capabilities = capabilities,
      })

      nvim_lsp["rust_analyzer"].setup({
        on_attach = on_attach,
        capabilities = capabilities,
      })

      nvim_lsp["zls"].setup({
        on_attach = on_attach,
        capabilities = capabilities,
      })

      nvim_lsp["clangd"].setup({
        on_attach = on_attach,
        capabilities = capabilities,
      })

      nvim_lsp["lua_ls"].setup({
        capabilities = capabilities,
        on_attach = on_attach,
        single_file_support = true,
        settings = {
          Lua = {
            diagnostics = {
              globals = { "vim", "require", "pcall", "pairs" },
            },
            workspace = {
              library = vim.api.nvim_get_runtime_file("", true),
              checkThirdParty = false,
            },
            completion = {
              workspaceWord = true,
              callSnippet = "Replace",
            },
          },
        },
      })

      nvim_lsp["efm"].setup({
        on_attach = on_attach,
        init_options = { documentFormatting = true },
        settings = {
          rootMarkers = { ".git/" },
          languages = {
            lua = { efm.formatting.stylua },
            javascript = { efm.diagnostics.eslint_d, efm.formatting.prettier_d },
            css = { efm.formatting.prettier_d },
            astro = { efm.diagnostics.eslint_d, efm.formatting.prettier_d },
            typescriptreact = { efm.diagnostics.eslint_d, efm.formatting.prettier_d },
            terraform = { efm.formatting.terraform },
          },
        },
      })
    end,
  },
}
