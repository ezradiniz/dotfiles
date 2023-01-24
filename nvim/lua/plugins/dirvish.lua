return {
  "justinmk/vim-dirvish",
  config = function ()
    vim.cmd([[
      augroup dirvish_config
          autocmd!
          autocmd FileType dirvish silent! unmap <buffer> <C-p>
      augroup end
    ]])
  end
}
