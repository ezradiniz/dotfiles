""""""""""""""""""""""""""""""
" => Load vim-plug
""""""""""""""""""""""""""""""
let s:vim_config = expand('<sfile>:p:h')."/.."
call plug#begin(s:vim_config.'/plugins')

"""""""""""""""""""""""""""""
" Plugs
"""""""""""""""""""""""""""""
Plug 'sjl/badwolf'
Plug 'w0rp/ale'
Plug 'ryanoasis/vim-devicons'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'pangloss/vim-javascript'
Plug 'peitalin/vim-jsx-typescript'
Plug 'leafgarland/typescript-vim'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'neoclide/coc.nvim', {'tag': '*', 'branch': 'release'}
Plug 'mileszs/ack.vim'
Plug 'jlanzarotta/bufexplorer'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'Raimondi/delimitMate'
Plug 'editorconfig/editorconfig-vim'
Plug 'cohama/lexima.vim'
Plug 'vim-scripts/mru.vim'
Plug 'scrooloose/nerdcommenter'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'scrooloose/nerdtree'
Plug 'myusuf3/numbers.vim'
Plug 'AndrewRadev/splitjoin.vim'
Plug 'ternjs/tern_for_vim'
Plug 'tomtom/tlib_vim'
Plug 'tpope/vim-abolish'
Plug 'markonm/traces.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tpope/vim-commentary'
Plug 'terryma/vim-expand-region'
Plug 'tpope/vim-fugitive'
Plug 'rbong/vim-flog'
Plug 'airblade/vim-gitgutter'
Plug 'fatih/vim-go'
Plug 'plasticboy/vim-markdown'
Plug 'xolox/vim-misc'
Plug 'terryma/vim-multiple-cursors'
Plug 'tpope/vim-rhubarb'
Plug 'tpope/vim-surround'
Plug 'tmux-plugins/vim-tmux-focus-events'
""""""""""""""""""""""""""""
call plug#end()
