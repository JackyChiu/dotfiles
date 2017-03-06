"""""""""""""""""""""""""""""
"""""	  JackyChiu	      """""
"""""	  Vim Dotfile	    """""
"""""""""""""""""""""""""""""

"""PLUGINS """
call plug#begin()
Plug 'christoomey/vim-tmux-navigator'    "Vim-Tmux navigation
Plug 'tpope/vim-surround'                "To add quotes and braces
Plug 'airblade/vim-gitgutter'            "Git additions and removals
Plug 'sheerun/vim-polyglot'              "Better syntax highlighting
Plug 'vim-syntastic/syntastic'           "Linter
Plug 'itchyny/lightline.vim'             "Powerline (lighter version)
Plug 'tpope/vim-fugitive'                "Git wrapper for vim
Plug 'tmux-plugins/vim-tmux-focus-events'"Improve autoread in tmux!
Plug 'ctrlpvim/ctrlp.vim'                "Fuzzy finder
" Golang
Plug 'fatih/vim-go', { 'do': ':GoInstallBinaries', 'for': 'go' }
"Auto completions ;)
Plug 'Valloric/YouCompleteMe', { 'do': './install.py --all' }
"Live preview
Plug 'shime/vim-livedown', { 'do': 'npm install -g livedown', 'for': 'markdown' }
"Java autocomplete
Plug 'artur-shaik/vim-javacomplete2', { 'for': 'java' } 
call plug#end()

"""BEHAVIOUR"""
"General
set autoread														"Auto read changes outside of vim
set clipboard=unnamed		        	    	"System register to be same as unnamed
set mouse=a                           	"Mouse click when just reading
set ttimeoutlen=10                      "Faster to exit insert mode

"Spacing and tabs
set backspace=indent,eol,start        	"Add this to your vimrc to make the backspace work like in most other programs
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

"""KEY MAPPINGS"""
"Easier way to enter new line
nnoremap <CR> i<CR><ESC>

"Easier to use tab than %
nnoremap <tab> %
vnoremap <tab> %

"Faster screen resizes
nnoremap <C-w>> 20<C-w>>
nnoremap <C-w>< 20<C-w><
nnoremap <C-w>+ 20<C-w>+
nnoremap <C-w>- 20<C-w>

"""LANG SPECIFIC"""
au FileType java setlocal omnifunc=javacomplete#Complete
au BufNewFile,BufRead *.java
      \ nnoremap <leader>jb :!javac %<CR> |
      \ nnoremap <leader>jj :!java %:r<CR> |
      \ nnoremap <leader>jd :!java -ea %:r<CR>

"""VISUAL"""
"Settings
set showmatch	                    	                 "Matching braces/brackets
set ruler	                        	                 "Show file title
set number		                                       "Show absolute number on current line
set relativenumber                     	             "Relative numbering

"Colours
let g:onedark_termcolors=256                         "Set onedark to use 256 colors
colorscheme onedark                                  "Use onedark theme
hi MatchParen cterm=bold ctermbg=blue ctermfg=black  "Matching paren hightlight color change
hi LineNr ctermfg=darkGrey                           "Lighter line numbers from OneDark theme
hi CursorLineNr ctermfg=blue                         "Make current line number blue
set cursorline                                       "Shows a visual cursor line
hi CursorLine term=bold cterm=bold guibg=Grey40      "Light grey colour for cursorline

"""PLUGINS"""
"Youcompleteme
let g:ycm_autoclose_preview_window_after_completion = 1"Close autocomplete preview window after completion

"CtrlP
let g:ctrlp_map = '<c-p>'                              "Map CtrlP to use <c-p>
let g:ctrlp_cmd = 'CtrlP'                              "CtrlP as defualt command
let g:ctrlp_working_path_mode = 'ra'                   "Open in current dir of file
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']"Ignore files in gitignore

"Synatasic settings
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_wq = 0                            "Don't check on save quit
let g:syntastic_javascript_checkers = ['eslint']           "Defualt to use eslint for javascript
let g:syntastic_javascript_eslint_exe = '$(npm bin)/eslint'"Use the local exe eslint in project
"Cleaner display of errors!
highlight link SyntasticErrorSign SignColumn
highlight link SyntasticWarningSign SignColumn
highlight link SyntasticStyleErrorSign SignColumn
highlight link SyntasticStyleWarningSign SignColumn

"Lightline (copy pasta material)
let g:lightline = {
      \ 'colorscheme': 'onedark',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ], [ 'fugitive', 'filename' ] ] ,
      \   'right': [ ['path'], ['fileformat', 'fileencoding', 'filetype'] ]
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
