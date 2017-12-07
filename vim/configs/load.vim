""""""""""""""""""""""""""""""
" => Load pathogen paths
""""""""""""""""""""""""""""""
let s:vim_config = expand('<sfile>:p:h')."/.."
call pathogen#infect(s:vim_config.'/plugins/{}')
call pathogen#helptags()
