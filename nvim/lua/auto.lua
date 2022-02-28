vim.cmd([[
  augroup highlight_yank
    autocmd!
    autocmd TextYankPost * silent! lua vim.highlight.on_yank {higroup="IncSearch", timeout=150}
  augroup end
]])

vim.cmd([[
  augroup editor
    autocmd!
    autocmd BufWritePre * :%s/\s\+$//e
  augroup end
]])

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
    autocmd BufWritePre *.go :silent! lua require('go.format').gofmt()
  augroup end
]])

