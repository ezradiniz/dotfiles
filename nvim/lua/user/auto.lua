vim.api.nvim_create_autocmd("TextYankPost", {
    callback=function ()
      vim.highlight.on_yank {higroup="IncSearch", timeout=150}
    end,
    pattern="*",
    group = vim.api.nvim_create_augroup("highlight_yank", { clear = true }),
})

vim.api.nvim_create_autocmd("BufWritePre", {
    callback = function ()
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

vim.api.nvim_create_autocmd("BufWritePre", {
    pattern = "*.go",
    callback = function ()
      require('go.format').goimport()
    end,
  group = vim.api.nvim_create_augroup("nvim_go", { clear = true }),
})
