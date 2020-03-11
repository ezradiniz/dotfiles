""""""""""""""""""""""""""""""
" => Load vim-plug
""""""""""""""""""""""""""""""
let s:vim_config = expand('<sfile>:p:h')."/.."
call plug#begin(s:vim_config.'/plugins')

"""""""""""""""""""""""""""""
" Plugs
"""""""""""""""""""""""""""""
Plug 'w0ng/vim-hybrid'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-dispatch'
Plug 'w0rp/ale'
Plug 'ryanoasis/vim-devicons'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'jlanzarotta/bufexplorer'
Plug 'editorconfig/editorconfig-vim'
Plug 'cohama/lexima.vim'
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
Plug 'plasticboy/vim-markdown'
Plug 'xolox/vim-misc'
Plug 'mg979/vim-visual-multi', {'branch': 'master'}
Plug 'tpope/vim-rhubarb'
Plug 'tpope/vim-surround'
Plug 'tmux-plugins/vim-tmux-focus-events'
Plug 'sheerun/vim-polyglot'
Plug 'junegunn/fzf', { 'do': './install --bin' }
Plug 'junegunn/fzf.vim'
""""""""""""""""""""""""""""
call plug#end()
