""""""""""""""""""""""""""""""
" => Load vim-plug
""""""""""""""""""""""""""""""
let s:vim_config = expand('<sfile>:p:h')."/.."
call plug#begin(s:vim_config.'/plugins/plugged')

"""""""""""""""""""""""""""""
" Plugs
"""""""""""""""""""""""""""""
Plug 'w0rp/ale'
Plug 'ryanoasis/vim-devicons'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'neoclide/coc.nvim', {'tag': '*', 'branch': 'release'}
""""""""""""""""""""""""""""
call plug#end()
