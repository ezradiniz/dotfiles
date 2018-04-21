""""""""""""""""""""""""""""""
" => Load vim-plug
""""""""""""""""""""""""""""""
let s:vim_config = expand('<sfile>:p:h')."/.."
call plug#begin(s:vim_config.'/plugins/plugged')	

"""""""""""""""""""""""""""""
" Plugs
"""""""""""""""""""""""""""""
Plug 'maralla/completor-typescript'
""""""""""""""""""""""""""""
call plug#end()
