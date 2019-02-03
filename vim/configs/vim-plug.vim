""""""""""""""""""""""""""""""
" => Load vim-plug
""""""""""""""""""""""""""""""
let s:vim_config = expand('<sfile>:p:h')."/.."
call plug#begin(s:vim_config.'/plugins/plugged')

"""""""""""""""""""""""""""""
" Plugs
"""""""""""""""""""""""""""""
Plug 'w0rp/ale'
Plug 'Shougo/vimproc.vim', {'do' : 'make'}
Plug 'prettier/vim-prettier', {
    \ 'do': 'npm install',
    \ 'for': ['javascript', 'typescript', 'css', 'less', 'scss'] }
Plug 'ryanoasis/vim-devicons'
""""""""""""""""""""""""""""
call plug#end()
