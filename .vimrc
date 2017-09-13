"""""""""""""""""""""""""""""
"""""	  JackyChiu	      """""
"""""	  Vim Dotfile	    """""
"""""""""""""""""""""""""""""

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

"""BEHAVIOUR"""
"General
set autoread														"Auto read changes outside of vim
set clipboard=unnamed		        	    	"System register to be same as unnamed
set mouse=a                           	"Mouse click when just reading
set ttimeoutlen=10                      "Faster to exit insert mode
set exrc                                "Allow for project specific vimrc

"Spacing and tabs
set backspace=2                         "Make backspace work like most other apps
set tabstop=2 			            	    	"Existing tabs to be shown with 2 spaces
set shiftwidth=2                      	"Size of indent
set softtabstop=2                     	"Backspace tab
set expandtab														"Tabs to spaces

"Backup and swap files
set undofile
set backupdir=~/.vim/.backup//        	"Dir for vim to save backup files
set directory=~/.vim/.swap//          	"Dir for vim to save swap files
set undodir=~/.vim/.undo//            	"Undo dir for vim

"Search 
set nohlsearch                        	"Don't continue to highlight searched phrases.
set incsearch                         	"But do highlight as you type your search.
set ignorecase                        	"Ignore casing when searching
set smartcase                         	"When searching be smart about casing

"Wildmenu
set wildmenu                          	"Use wildmenu
set wildmode=longest:full,full        	"Wild mode for wildmenu
set wildignore=*.o,*.class,*.pyc,*.git	"Wild menu to ignore compiled files

"""VISUAL"""
"Settings
set showmatch	                              "Matching braces/brackets
set ruler	                                  "Show file title
set number		                              "Show absolute number on current line
set relativenumber                          "Relative numbering
set scrolloff=5                             "Always 5 lines before or after cusor
set cursorline                              "Shows a visual cursor line

"Colours
if (has("termguicolors"))
  set termguicolors
  "Set Vim-specific sequences for RGB colors
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
endif
colorscheme onedark

"""KEY MAPPINGS"""
"Faster screen resizes
nnoremap <C-w>> 20<C-w>>
nnoremap <C-w>< 20<C-w><
nnoremap <C-w>+ 20<C-w>+
nnoremap <C-w>- 20<C-w>

nnoremap <CR> i<CR><ESC>

"I do :W all the time
command! W w
command! Wq wq

"""FILE SPECIFIC"""
"Set spell for these files
au FileType gitcommit setlocal spell
au FileType markdown setlocal spell

"Java
au BufNewFile,BufRead *.java
      \ nnoremap <leader>b :!javac %<CR> |
      \ nnoremap <leader>r :!java -ea %:r<CR>
au FileType java setlocal omnifunc=javacomplete#Complete

"Go
au FileType go nmap <leader>r <Plug>(go-run)
au FileType go nmap <leader>R <Plug>(go-rename)
au FileType go nmap <leader>b <Plug>(go-build)
au FileType go nmap <leader>t <Plug>(go-test)
au FileType go nmap <leader>c <Plug>(go-coverage-toggle)
au FileType go nnoremap <buffer> <silent> gd :GoDef<CR>

"""PLUGINS"""
"FZF
nnoremap <C-t> :FZF<CR>

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

"NerdTree
nnoremap <C-n> :NERDTreeToggle<CR>
"NERDTree automatically when vim starts up if no files were specified
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif
"Close vim if NerdTree is last window
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif 

set secure                "Disable unsafe commands in project vimrcs
