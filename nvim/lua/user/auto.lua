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

-- TODO: refactor to lua api
vim.cmd([[
  function! MkNonExDir(file, buf)
    if empty(getbufvar(a:buf, '&buftype')) && a:file!~#'\v^\w+\:\/'
      let dir=fnamemodify(a:file, ':h')
        if !isdirectory(dir)
          call mkdir(dir, 'p')
        endif
      endif
  endfunction

  augroup custom
    autocmd!
    autocmd BufWritePre * :call MkNonExDir(expand('<afile>'), +expand('<abuf>'))
  augroup end
]])

vim.cmd([[
  augroup nvim_go
    autocmd!
    autocmd BufWritePre *.go :silent! lua require('go.format').goimport()
  augroup end
]])
