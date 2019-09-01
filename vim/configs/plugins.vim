""""""""""""""""""""""""""""""
" => multiple-cursors
""""""""""""""""""""""""""""""
let g:multi_cursor_use_default_mapping=0

" Default mapping
let g:multi_cursor_start_word_key      = '<C-n>'
let g:multi_cursor_select_all_word_key = '<A-n>'
let g:multi_cursor_start_key           = 'g<C-n>'
let g:multi_cursor_select_all_key      = 'g<A-n>'
let g:multi_cursor_next_key            = '<C-n>'
let g:multi_cursor_prev_key            = '<C-p>'
let g:multi_cursor_skip_key            = '<C-z>'
let g:multi_cursor_quit_key            = '<Esc>'


""""""""""""""""""""""""""""""
" => bufExplorer plugin
""""""""""""""""""""""""""""""
let g:bufExplorerDefaultHelp=1
let g:bufExplorerShowRelativePath=1
let g:bufExplorerFindActive=1
let g:bufExplorerSortBy='name'
map <leader>o :BufExplorer<cr>


""""""""""""""""""""""""""""""
" => MRU plugin
""""""""""""""""""""""""""""""
let MRU_Max_Entries = 400
map <leader>f :MRU<CR>


""""""""""""""""""""""""""""""
" => YankStack
""""""""""""""""""""""""""""""
let g:yankstack_yank_keys = ['y', 'd']

nmap <c-p> <Plug>yankstack_substitute_older_paste
nmap <c-n> <Plug>yankstack_substitute_newer_paste


""""""""""""""""""""""""""""""
" => CTRL-P
""""""""""""""""""""""""""""""
let g:ctrlp_working_path_mode = 0

let g:ctrlp_map = '<c-f>'
map <leader>j :CtrlP<cr>
map <c-b> :CtrlPBuffer<cr>

let g:ctrlp_max_height = 25
let g:ctrlp_custom_ignore = '__init__.py\|env\|dist\|build\|node_modules\|^\.next\|^\.DS_Store\|^\.vscode\|^\.git\|^\.coffee'


""""""""""""""""""""""""""""""
" => ZenCoding
""""""""""""""""""""""""""""""
" Enable all functions in all modes
let g:user_zen_mode='a'


""""""""""""""""""""""""""""""
" => snipMate (~)
""""""""""""""""""""""""""""""
imap « <esc>a<Plug>snipMateNextOrTrigger
smap « <Plug>snipMateNextOrTrigger

""""""""""""""""""""""""""""""
" => Vim grep
""""""""""""""""""""""""""""""
let Grep_Skip_Dirs = 'RCS CVS SCCS .svn generated'
set grepprg=/bin/grep\ -nH


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Nerd Tree
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:NERDTreeWinPos = "right"
let NERDTreeShowHidden=0
let g:NERDTreeChDirMode=2
let g:NERDTreeIgnore=['\.rbc$', '\~$', '\.pyc$', '\.db$', '\.sqlite$', '__pycache__', 'node_modules', 'build', 'dist']
let g:NERDTreeShowBookmarks=1
let g:NERDTreeWinSize=35
map <leader>nn :NERDTreeToggle<cr>
map <leader>nb :NERDTreeFromBookmark<Space>
map <leader>nf :NERDTreeFind<cr>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => surround.vim config
" Annotate strings with gettext 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
vmap Si S(i_<esc>f)
au FileType mako vmap Si S"i${ _(<esc>2f"a) }<esc>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Vim-go
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
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

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => ale (syntax checker)
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:ale_linters = {}
"let g:ale_dockerfile_hadolint_use_docker = 'yes'
let g:ale_lint_on_text_changed = 'never'
let g:ale_list_window_size = 15

:call extend(g:ale_linters, {
    \"go": ['golint', 'go vet'], })

:call extend(g:ale_linters, {
    \'python': ['flake8'], })

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Git gutter (Git diff)
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:gitgutter_enabled=0
nnoremap <silent> <leader>d :GitGutterToggle<cr>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Numbers line
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <F3> :NumbersToggle<CR>
nnoremap <F4> :NumbersOnOff<CR> 

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Vim-JSX
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:jsx_ext_required = 0
let g:javascript_enable_domhtmlcss = 1
let g:used_javascript_libs = 'underscore,react,chai,lodash'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Vim-jsx-typescript
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
autocmd BufNewFile,BufRead *.tsx,*.jsx set filetype=typescript.jsx
" light blues
" light blues
hi xmlTagName guifg=#59ACE5
hi xmlTag guifg=#59ACE5
"
" " dark blues
hi xmlEndTag guifg=#2974a1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => typescript-vim
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
setlocal indentkeys+=0.
let g:typescript_opfirst='\%([<>=,?^%|*/&]\|\([-:+]\)\1\@!\|!=\|in\%(stanceof\)\=\>\)'
autocmd FileType typescript :set makeprg=tsc
autocmd QuickFixCmdPost [^l]* nested cwindow
autocmd QuickFixCmdPost    l* nested lwindow

autocmd FileType json syntax match Comment +\/\/.\+$+

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Coc-vim
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> for trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

function! SetupCommandAbbrs(from, to)
  exec 'cnoreabbrev <expr> '.a:from
        \ .' ((getcmdtype() ==# ":" && getcmdline() ==# "'.a:from.'")'
        \ .'? ("'.a:to.'") : ("'.a:from.'"))'
endfunction

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

" Use C to open coc config
call SetupCommandAbbrs('C', 'CocConfig')

" Add status line support, for integration with other plugin, checkout `:h coc-status`
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Airline_theme
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:airline_theme='wombat'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#virtualenv#enabled = 1
let g:airline#extensions#ale#enabled = 1
let g:airline_powerline_fonts = 1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => vim-markdown
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:vim_markdown_folding_disabled = 1
let g:vim_markdown_follow_anchor = 1


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => vim-devicons
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:webdevicons_enable_nerdtree = 1
let g:webdevicons_conceal_nerdtree_brackets = 1
let g:webdevicons_enable_ctrlp = 1
let g:webdevicons_enable_airline_tabline = 1
let g:webdevicons_enable_airline_statusline = 1
