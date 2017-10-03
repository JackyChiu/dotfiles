"""PLUGINS """
call plug#begin()
Plug 'christoomey/vim-tmux-navigator'       "Vim-Tmux navigation
Plug 'tmux-plugins/vim-tmux-focus-events'   "Improve autoread in tmux!
Plug 'sheerun/vim-polyglot'                 "Better syntax highlighting
Plug 'itchyny/lightline.vim'                "Powerline (lighter version)
Plug 'vim-syntastic/syntastic'              "Linter
Plug 'airblade/vim-gitgutter'               "Git additions and removals
Plug 'tpope/vim-surround'                   "Easy brace and quote changes
Plug 'tpope/vim-fugitive'                   "Git wrapper for vim
Plug 'scrooloose/nerdtree'                  "Tree explore for large projects
Plug 'SirVer/ultisnips'                     "Snippets
""Auto completions ;)
Plug 'Valloric/YouCompleteMe', { 'do': './install.py --all' }
"" Golang
Plug 'fatih/vim-go', { 'do': ':GoInstallBinaries', 'for': 'go' }
"" Fuzzy finder
Plug '/usr/local/opt/fzf' | Plug 'junegunn/fzf.vim', { 'dir': '~/.fzf', 'do': './install --all' }
""Live preview
Plug 'shime/vim-livedown', { 'do': 'npm install -g livedown', 'for': 'markdown' }
""Java autocomplete
Plug 'artur-shaik/vim-javacomplete2', { 'for': 'java' } 
call plug#end()

"FZF
nnoremap <C-t> :FZF<CR>
nnoremap <C-f> :F<space>
set grepprg=rg\ --vimgrep               "Use ripgrep
" --column: Show column number
" --line-number: Show line number
" --no-heading: Do not show file headings in results
" --fixed-strings: Search term as a literal string
" --ignore-case: Case insensitive search
" --hidden: Search hidden files and folders
" --follow: Follow symlinks
" --glob: Additional conditions for search (in this case ignore everything in the .git/ folder)
" --color: Search color options
let g:rg_command = 'rg --column --line-number --no-heading --fixed-strings --ignore-case --hidden --follow --glob "!.git/*" --color "always" '
command! -bang -nargs=* F call fzf#vim#grep(g:rg_command .shellescape(<q-args>), 1, <bang>0)

"Youcompleteme
let g:ycm_autoclose_preview_window_after_completion = 1   "Close autocomplete preview window after completion

"Vim-go
"More highlights!
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_fields = 1
let g:go_highlight_types = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1

let g:go_fmt_command = "goimports"        "Auto add imports
let g:go_def_mapping_enabled = 0          "Don't use C-t

au FileType go nmap <leader>r <Plug>(go-run)
au FileType go nmap <leader>R <Plug>(go-rename)
au FileType go nmap <leader>b <Plug>(go-build)
au FileType go nmap <leader>t <Plug>(go-test)
au FileType go nmap <leader>c <Plug>(go-coverage-toggle)
au FileType go nnoremap <buffer> <silent> gd :GoDef<CR>

"Synatasic settings
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_wq = 0                            "Don't check on save quit
"Javascript
let g:syntastic_javascript_checkers = ['eslint']           "Defualt to use eslint for javascript
let g:syntastic_javascript_eslint_exe = '$(npm bin)/eslint'"Use the local exe eslint in project
"Go
let g:syntastic_go_checkers = ['golint', 'govet', 'errcheck']
let g:syntastic_mode_map = { 'mode': 'active', 'passive_filetypes': ['go'] }
let g:go_list_type = "quickfix"
"Cleaner display of errors!
highlight link SyntasticErrorSign SignColumn
highlight link SyntasticWarningSign SignColumn
highlight link SyntasticStyleErrorSign SignColumn
highlight link SyntasticStyleWarningSign SignColumn

"UltiSnips
let g:UltiSnipsExpandTrigger="<c-x>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"

"Javacomplete
au FileType java setlocal omnifunc=javacomplete#Complete

"NerdTree
nnoremap <C-n> :NERDTreeToggle<CR>
"NERDTree automatically when vim starts up if no files were specified
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif
"Close vim if NerdTree is last window
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif 

"Lightline (copy pasta material)
let g:lightline = {
      \ 'colorscheme': 'onedark',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ], [ 'fugitive', 'filename' ] ] ,
      \   'right': [ ['path'], ['filetype'] ]
      \ },
      \ 'component_function': {
      \   'fugitive': 'LightlineFugitive',
      \   'readonly': 'LightlineReadonly',
      \   'modified': 'LightlineModified',
      \   'filename': 'LightlineFilename',
      \   'path': 'LightLinePath'
      \ },
      \ 'separator': { 'left': '', 'right': '' },
      \ 'subseparator': { 'left': '', 'right': '' }
      \ }
set laststatus=2                                       "Used to see airline without opening split
set noshowmode                                         "Don't repeat vim modes in indicator

function! LightlineModified()
  return &ft =~ 'help' ? '' : &modified ? '+' : &modifiable ? '' : '-'
endfunction

function! LightlineReadonly()
  return &ft !~? 'help' && &readonly ? '' : ''
endfunction

function! LightlineFugitive()
  if exists("*fugitive#head")
    let branch = fugitive#head()
    return branch !=# '' ? ' '.branch : ''
  endif
  return ''
endfunction

function! LightlineFilename()
  return ('' != LightlineReadonly() ? LightlineReadonly() . ' ' : '') .
        \ ('' != expand('%:t') ? expand('%:t') : '[No Name]') .
        \ ('' != LightlineModified() ? ' ' . LightlineModified() : '')
endfunction

function! LightLinePath()
  return winwidth(0) > 70 ? expand('%:p:~:h') : ''
endfunction