""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Vim-Plug core (https://github.com/editor-bootstrap/vim-bootstrap)
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let vimplug_exists=expand('~/.local/share/nvim/site/autoload/plug.vim')

if !filereadable(vimplug_exists)
  if !executable("curl")
    echoerr "You have to install curl or first install vim-plug yourself!"
    execute "q!"
  endif
  echo "Installing Vim-Plug..."
  echo ""
  silent exec "!\curl -fLo " . vimplug_exists . " --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"
  let g:not_finish_vimplug = "yes"

  autocmd VimEnter * PlugInstall
endif

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Load vim-plug
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
call plug#begin(expand('~/.vim/plugged'))

Plug 'AndrewRadev/splitjoin.vim'
Plug 'airblade/vim-gitgutter'
Plug 'cohama/lexima.vim'
Plug 'fatih/vim-go', {'do': ':GoInstallBinaries'}
Plug 'itchyny/lightline.vim'
Plug 'junegunn/fzf', { 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'justinmk/vim-dirvish'
Plug 'mg979/vim-visual-multi', {'branch': 'master'}
Plug 'morhetz/gruvbox'
Plug 'neovim/nvim-lsp'
Plug 'nvim-lua/completion-nvim'
Plug 'nvim-lua/diagnostic-nvim'
Plug 'plasticboy/vim-markdown'
Plug 'rbong/vim-flog'
Plug 'sheerun/vim-polyglot'
Plug 'terryma/vim-expand-region'
Plug 'tmux-plugins/vim-tmux-focus-events'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'

call plug#end()

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Core Setup
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nocompatible
filetype plugin on
filetype indent on

let mapleader = ","
let g:mapleader = ","

set path+=**
set history=10000
set clipboard=unnamed
set autoread

nmap <leader>w :w!<cr>
command! W w !sudo tee % > /dev/null

set shortmess+=c
set updatetime=100
set cursorline
let $LANG='en' 
set langmenu=en
set wildmenu
set wildignore=*.o,*~,*.pyc,*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store,node_modules/**
set ruler
set cmdheight=1
set signcolumn=auto
set hidden
set backspace=eol,start,indent
set whichwrap+=<,>,h,l
set ignorecase
set smartcase
set grepprg=/bin/grep\ -nH
set incsearch 
set lazyredraw 
set magic
set showmatch 
set mat=2
set noerrorbells
set novisualbell
set t_vb=
set t_ut=
set tm=500
set relativenumber
set number
set virtualedit=block
set nrformats+=alpha

" highlighting
set hlsearch
nnoremap <leader><Enter> :noh<CR>

set notimeout
set ttimeout
set ttimeoutlen=0
set ttyfast

set colorcolumn=80

syntax enable
if exists('+termguicolors')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif

set background=dark
let g:gruvbox_contrast_dark="hard"
colorscheme gruvbox

set encoding=utf8
set nobackup
set nowb
set noswapfile
set lbr
set nowrap
set tw=80
set linebreak
let &showbreak='▷ '
set fileformats+=dos
set binary
set noeol
set listchars=tab:.\ ,trail:-,extends:>,precedes:<,nbsp:+
set list

" very useful
map 0 ^

set expandtab
set smarttab
set shiftwidth=4
set softtabstop=4

map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

map <leader>bd :Bclose<cr>:tabclose<cr>gT
map <leader>ba :bufdo bd<cr>
map <leader>tn :tabnew<cr>
map <leader>to :tabonly<cr>
map <leader>tc :tabclose<cr>
map <leader>tm :tabmove 
map <leader>ty :tabnext<cr>
map <leader>tr :tabprev<cr>

try
  set switchbuf=usetab
  set stal=2
catch
endtry

set laststatus=2
set noshowmode

fun! CleanExtraSpaces()
    let save_cursor = getpos(".")
    let old_query = getreg('/')
    silent! %s/\s\+$//e
    call setpos('.', save_cursor)
    call setreg('/', old_query)
endfun

noremap <Leader>m mmHmt:%s/<C-V><cr>//ge<cr>'tzt'm
map <leader>q :e ~/.vim/buffer<cr>
map <leader>x :e ~/.vim/buffer.md<cr>
noremap <leader>e :e! ~/.vimrc<cr>
map <leader>pp :setlocal paste!<cr>
au InsertLeave * silent! set nopaste

try
    set undofile
    set undodir=~/.vim/cache
catch
endtry
map <leader>cco :botright cope<cr>
map <leader>llo :botright lope<cr>
map <leader>co ggVGy:tabnew<cr>:set syntax=qf<cr>pgg

vnoremap <silent> * :<C-u>call VisualSelection()<CR>/<C-R>=@/<CR><CR>
vnoremap <silent> # :<C-u>call VisualSelection()<CR>?<C-R>=@/<CR><CR>

nnoremap <leader>cd :lcd %:p:h<cr>

""""""""""""""""""""""""""""""
" => Core functions
""""""""""""""""""""""""""""""

function! VisualSelection() range
    let l:saved_reg = @"
    execute "normal! vgvy"

    let l:pattern = escape(@", "\\/.*'$^~[]")
    let l:pattern = substitute(l:pattern, "\n$", "", "")

    let @/ = l:pattern
    let @" = l:saved_reg
endfunction

command! Bclose call <SID>BufcloseCloseIt()
function! <SID>BufcloseCloseIt()
   let l:currentBufNum = bufnr("%")
   let l:alternateBufNum = bufnr("#")

   if buflisted(l:alternateBufNum)
     buffer #
   else
     bnext
   endif

   if bufnr("%") == l:currentBufNum
     new
   endif

   if buflisted(l:currentBufNum)
     execute("bdelete! ".l:currentBufNum)
   endif
endfunction

function! s:MkNonExDir(file, buf)
  if empty(getbufvar(a:buf, '&buftype')) && a:file!~#'\v^\w+\:\/'
    let dir=fnamemodify(a:file, ':h')
      if !isdirectory(dir)
        call mkdir(dir, 'p')
      endif
    endif
endfunction

xnoremap @ :<C-u>call ExecuteMacroOverVisualRange()<CR>
function! ExecuteMacroOverVisualRange()
  echo "@".getcmdline()
  execute ":'<,'>normal @".nr2char(getchar())
endfunction

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Plug Setup
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""
" => completion-vim
""""""""""""""""""""""""""""""
lua require'nvim_lsp'.tsserver.setup{on_attach=require'completion'.on_attach}
lua require'nvim_lsp'.sumneko_lua.setup{on_attach=require'completion'.on_attach}

inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

set completeopt=menuone,noinsert,noselect

nnoremap <silent> gd    <cmd>lua vim.lsp.buf.declaration()<CR>
nnoremap <silent> <c-]> <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent> K     <cmd>lua vim.lsp.buf.hover()<CR>
nnoremap <silent> gD    <cmd>lua vim.lsp.buf.implementation()<CR>
nnoremap <silent> <c-k> <cmd>lua vim.lsp.buf.signature_help()<CR>
nnoremap <silent> 1gD   <cmd>lua vim.lsp.buf.type_definition()<CR>
nnoremap <silent> gr    <cmd>lua vim.lsp.buf.references()<CR>
nnoremap <silent> g0    <cmd>lua vim.lsp.buf.document_symbol()<CR>
nnoremap <silent> gW    <cmd>lua vim.lsp.buf.workspace_symbol()<CR>

""""""""""""""""""""""""""""""
" => vim-fugitive
""""""""""""""""""""""""""""""
let g:fugitive_pty = 0

""""""""""""""""""""""""""""""
" => fzf.vim
""""""""""""""""""""""""""""""
nnoremap <c-b> :Buffers<cr>
nnoremap <c-f> :Files<cr>
nnoremap <c-p> :GFiles<cr>
nnoremap <leader>` :Marks<cr>
nnoremap q: :History:<cr>
let g:fzf_layout = { 'down': '~40%' }
let g:fzf_buffers_jump = 1

""""""""""""""""""""""""""""""
" => vim-dirvish
""""""""""""""""""""""""""""""
augroup dirvish_config
    autocmd!
    autocmd FileType dirvish nnoremap <buffer><silent> <c-p> :GFiles<cr>
augroup end

""""""""""""""""""""""""""""""
" => Vim-go
""""""""""""""""""""""""""""""
let g:go_def_mapping_enabled = 0
let g:go_code_completion_enabled = 0
let g:go_list_type = "quickfix"
let g:go_fmt_command = "goimports"
let g:go_fmt_fail_silently = 1

let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
let g:go_highlight_structs = 1
let g:go_highlight_generate_tags = 1
let g:go_highlight_space_tab_error = 0
let g:go_highlight_array_whitespace_error = 0
let g:go_highlight_trailing_whitespace_error = 0
let g:go_highlight_extra_types = 1
let g:go_highlight_function_calls = 1

""""""""""""""""""""""""""""""
" => Git gutter (Git diff)
""""""""""""""""""""""""""""""
let g:gitgutter_enabled=1
nnoremap <silent> <leader>d :GitGutterToggle<cr>
nnoremap <leader>dd : GitGutterLineHighlightsToggle<cr>

function! GitStatus()
    let [a,m,r] = GitGutterGetHunkSummary()
    return printf('+%d ~%d -%d', a, m, r)
endfunction

""""""""""""""""""""""""""""""
" => vim-visual-multi
""""""""""""""""""""""""""""""
let g:VM_maps = {}
let g:VM_maps['Add Cursor Up'] = '<F3>'
let g:VM_maps['Add Cursor Down'] = '<F2>'

""""""""""""""""""""""""""""""
" => lightline.vim
""""""""""""""""""""""""""""""
let g:lightline = {
      \ 'colorscheme': 'gruvbox',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'gitstatus' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'FugitiveHead',
      \   'gitstatus': 'GitStatus',
      \ },
      \ }

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Autocmd
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
augroup MyAutoCmd
  autocmd!

  autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
  autocmd BufWritePre *.tsx,*.ts,*.txt,*.js,*.py,*.wiki,*.sh,*.coffee :call CleanExtraSpaces()
  autocmd BufWritePre * :call s:MkNonExDir(expand('<afile>'), +expand('<abuf>'))

  autocmd BufNewFile,BufRead *.go setlocal noexpandtab tabstop=4 shiftwidth=4 softtabstop=4
  autocmd BufNewFile,BufRead *.ts,*.tsx setlocal expandtab smarttab shiftwidth=4 softtabstop=4
  autocmd FileType make setlocal noexpandtab
  autocmd BufNewFile,BufRead *.md setlocal wrap
augroup END
