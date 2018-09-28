""""""""""""""""""""""""""""""
" => Load vim-plug
""""""""""""""""""""""""""""""
let s:vim_config = expand('<sfile>:p:h')."/.."
call plug#begin(s:vim_config.'/plugins/plugged')

"""""""""""""""""""""""""""""
" Plugs
"""""""""""""""""""""""""""""
Plug 'maralla/completor-typescript'
Plug 'prettier/vim-prettier', {
    \ 'do': 'npm install',
    \ 'for': ['javascript', 'typescript', 'css', 'less', 'scss'] }
""""""""""""""""""""""""""""
call plug#end()
