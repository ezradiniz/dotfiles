vim.api.nvim_create_autocmd("TextYankPost", {
  callback = function()
    vim.highlight.on_yank({ higroup = "IncSearch", timeout = 150 })
  end,
  pattern = "*",
  group = vim.api.nvim_create_augroup("highlight_yank", { clear = true }),
})

vim.api.nvim_create_autocmd("BufWritePre", {
  callback = function()
    vim.cmd([[
            let save = winsaveview()
            keeppatterns %s/\s\+$//e
            call winrestview(save)
      ]])
  end,
  pattern = "*",
  group = vim.api.nvim_create_augroup("trim_whitespace", { clear = true }),
})

vim.api.nvim_create_autocmd("BufNewFile", {
  pattern = "*",
  callback = function()
    local dir = vim.fn.expand("<afile>:p:h")
    if vim.fn.isdirectory(dir) == 0 then
      vim.fn.mkdir(dir, "p")
      vim.cmd([[ :e % ]])
    end
  end,
  group = vim.api.nvim_create_augroup("mk_non_ex_dir", { clear = true }),
})

-- jump to the last place you've visited in a file before exiting
vim.api.nvim_create_autocmd("BufReadPost", {
  callback = function()
    local mark = vim.api.nvim_buf_get_mark(0, '"')
    local lcount = vim.api.nvim_buf_line_count(0)
    if mark[1] > 0 and mark[1] <= lcount then
      pcall(vim.api.nvim_win_set_cursor, 0, mark)
    end
  end,
})

vim.api.nvim_create_autocmd("FileType", {
  callback = function()
    vim.opt.foldlevel = 99
    if require("nvim-treesitter.parsers").has_parser() then
      vim.opt.foldmethod = "expr"
      vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
      vim.wo.foldtext = "v:lua.vim.treesitter.foldtext()"
      vim.wo.foldexpr = "v:lua.vim.treesitter.foldexpr()"
    else
      vim.opt.foldmethod = "manual"
    end
  end,
  group = vim.api.nvim_create_augroup("foldmethod", { clear = true }),
})
