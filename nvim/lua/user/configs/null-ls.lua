local null_ls = require("null-ls")

local sources = {
    null_ls.builtins.formatting.prettier,
    null_ls.builtins.formatting.eslint_d,
    null_ls.builtins.diagnostics.eslint_d,
    null_ls.builtins.formatting.stylua,
}

null_ls.setup({
    sources = sources,
    should_attach = function(bufnr)
        return not vim.api.nvim_buf_get_name(bufnr):match("^git://")
    end,
})
