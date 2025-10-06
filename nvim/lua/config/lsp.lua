local on_attach = function(client, bufnr)
  if vim.api.nvim_buf_get_name(bufnr):match("^%a+://") then
    return
  end

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
  vim.keymap.set("n", "[d", function()
    vim.diagnostic.jump({ count = -1 })
  end, opts)
  vim.keymap.set("n", "]d", function()
    vim.diagnostic.jump({ count = 1 })
  end, opts)
  vim.keymap.set("n", "<space>q", vim.diagnostic.setloclist, opts)

  -- inlay hints
  if client:supports_method("textDocument/inlayHint") then
    vim.lsp.inlay_hint.enable(true)
  end
end

vim.diagnostic.config({
  severity_sort = true,
  virtual_text = true,
  float = { source = "if_many" },
  signs = false,
})

vim.api.nvim_create_autocmd("LspAttach", {
  desc = "Configure LSP keymaps",
  callback = function(args)
    local client = vim.lsp.get_client_by_id(args.data.client_id)
    on_attach(client, args.buf)
  end,
})

vim.api.nvim_create_autocmd({ "BufReadPre", "BufNewFile" }, {
  once = true,
  callback = function()
    local server_configs = vim
      .iter(vim.api.nvim_get_runtime_file("lsp/*.lua", true))
      :map(function(file)
        return vim.fn.fnamemodify(file, ":t:r")
      end)
      :totable()
    vim.print(server_configs)
    vim.lsp.enable(server_configs)
  end,
})

vim.api.nvim_create_autocmd("LspProgress", {
  callback = function(ev)
    local value = ev.data.params.value
    if value.kind == "begin" then
      vim.api.nvim_ui_send("\027]9;4;1;0\027\\")
    elseif value.kind == "end" then
      vim.api.nvim_ui_send("\027]9;4;0\027\\")
    elseif value.kind == "report" then
      vim.api.nvim_ui_send(string.format("\027]9;4;1;%d\027\\", value.percentage or 0))
    end
  end,
})
