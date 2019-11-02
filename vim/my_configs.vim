"""""""""""""""""""""""""""""""""""""""""""" 
" => Text, tab and indent related                               
"""""""""""""""""""""""""""""""""""""""""""" 
" Use spaces instead of tabs and Be smart when using tabs ;)
set expandtab
set smarttab

" Spaces
set shiftwidth=2
set softtabstop=2

autocmd BufNewFile,BufRead *.tsx,*.jsx set filetype=typescript.jsx
autocmd FileType typescript,typescript.jsx setlocal tabstop=4 shiftwidth=4 softtabstop=4
autocmd FileType javascript setlocal tabstop=4 shiftwidth=4 softtabstop=4
autocmd FileType python setlocal shiftwidth=4 softtabstop=4
autocmd BufNewFile,BufRead *.go setlocal noexpandtab tabstop=4 shiftwidth=4 softtabstop=4
