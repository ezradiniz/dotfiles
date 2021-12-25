local nvim_lsp = require('lspconfig')
local util = require('lspconfig/util')

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
    root_dir = function(fname)
        return util.find_git_ancestor(fname) or vim.loop.cwd()
    end,
    init_options = {documentFormatting = true},
    filetypes = {
        "javascript", "javascriptreact", "javascript.jsx", "typescript",
        "typescript.tsx", "typescriptreact", "python", "lua"
    },
    settings = {
        rootMarkers = {".git/"},
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
