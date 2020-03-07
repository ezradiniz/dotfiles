"""""""""""""""""""""""""""""""""""""""""""" 
" => Text, tab and indent related                               
"""""""""""""""""""""""""""""""""""""""""""" 
" Use spaces instead of tabs and Be smart when using tabs ;)
set expandtab
set smarttab

" Spaces
set shiftwidth=4
set softtabstop=4

autocmd BufNewFile,BufRead *.go setlocal noexpandtab tabstop=4 shiftwidth=4 softtabstop=4
