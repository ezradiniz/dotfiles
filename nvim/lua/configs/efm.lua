local nvim_lsp = require('lspconfig')

local eslint = {
    lintCommand = "eslint_d -f unix --stdin --stdin-filename ${INPUT}",
    lintStdin = true,
    lintFormats = {"%f:%l:%c: %m"},
    lintIgnoreExitCode = true,
    formatCommand = "eslint_d --fix-to-stdout --stdin --stdin-filename=${INPUT}",
    formatStdin = true
}

local isort = {formatCommand = "isort --quiet -", formatStdin = true}

local luaFormat = {formatCommand = 'lua-format -i', formatStdin = true}

nvim_lsp.efm.setup {
    init_options = {documentFormatting = true},
    filetypes = {
        "javascript", "javascriptreact", "javascript.jsx", "typescript",
        "typescript.tsx", "typescriptreact", "python"
    },
    settings = {
        languages = {
            lua = {luaFormat},
            javascript = {eslint},
            javascriptreact = {eslint},
            ["javascript.jsx"] = {eslint},
            typescript = {eslint},
            ["typescript.tsx"] = {eslint},
            typescriptreact = {eslint},
            python = {isort}
        }
    }
}

vim.cmd([[
    augroup formatting
        autocmd!
        autocmd BufWritePre *.lua :lua vim.lsp.buf.formatting_sync(nil, 100)
    augroup end
]])
