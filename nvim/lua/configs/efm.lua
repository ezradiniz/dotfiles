local nvim_lsp = require('lspconfig')

local eslint = {
    lintCommand = "eslint_d -f unix --stdin --stdin-filename ${INPUT}",
    lintStdin = true,
    lintFormats = {"%f:%l:%c: %m"},
    lintIgnoreExitCode = true,
    formatCommand = "eslint_d --fix-to-stdout --stdin --stdin-filename=${INPUT}",
    formatStdin = true
}

nvim_lsp.efm.setup {
    init_options = {documentFormatting = true},
    filetypes = {
        "lua", "javascript", "javascriptreact", "javascript.jsx", "typescript",
        "typescript.tsx", "typescriptreact"
    },
    settings = {
        languages = {
            lua = {{formatCommand = 'lua-format -i', formatStdin = true}},
            javascript = {eslint},
            javascriptreact = {eslint},
            ["javascript.jsx"] = {eslint},
            typescript = {eslint},
            ["typescript.tsx"] = {eslint},
            typescriptreact = {eslint}
        }
    }
}

vim.cmd([[
    augroup formatting
        autocmd!
        autocmd BufWritePre *.lua :lua vim.lsp.buf.formatting_sync(nil, 100)
    augroup end
]])
