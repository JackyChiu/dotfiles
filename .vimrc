"""""""""""""""""""""""""""""
"""""	JackyChiu	"""""
"""""	Vim Dotfile	"""""
"""""""""""""""""""""""""""""

""" GENERAL """
set nocompatible	"Disable vi compatibility mode
filetype off		

""" PLUGINS  """
"Set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'               "Vundle to install plugins
Plugin 'scrooloose/nerdtree'                "Project tree view
Plugin 'Valloric/YouCompleteMe'             "Auto completions ;)
Plugin 'christoomey/vim-tmux-navigator'     "Vim-Tmux navigation
Plugin 'tpope/vim-surround'                 "To add quotes and braces
Plugin 'airblade/vim-gitgutter'             "Git additions and removals
Plugin 'sheerun/vim-polyglot'               "Better syntax highlighting
Plugin 'vim-airline/vim-airline'            "Airline bar for vim
Plugin 'vim-airline/vim-airline-themes'     "Need for airline themes to work
Plugin 'tpope/vim-fugitive'                 "Git wrapper for vim
Plugin 'tmux-plugins/vim-tmux-focus-events' "Improve autoread in tmux!
Plugin 'ctrlpvim/ctrlp.vim'                     "Fuzzy finder

call vundle#end()
filetype plugin indent on

""" BEHAVIOUR """
" Misc
set autoread                                            "Auto read changes outside of vim
set clipboard=unnamed		        	                "System register to be same as unnamed
let g:ycm_autoclose_preview_window_after_completion = 1 "Close autocomplete preview window after completion
set mouse=a                                             "Mouse click when just reading
" Spacing and tabs
set backspace=indent,eol,start                          "Add this to your vimrc to make the backspace work like in most other programs
set tabstop=4 			            	                "Existing tabs to be shown with 4 spaces
set shiftwidth=4                                        "Size of indent
set softtabstop=4                                       "Backspace tab
set expandtab 			            	                "Tab to be 4 spaces
" Backup and swap files
set undofile
set backupdir=~/.vim/.backup//                          "Dir for vim to save backup files
set directory=~/.vim/.swap//                            "Dir for vim to save swap files
set undodir=~/.vim/.undo//                              "Undo dir for vim
" Search 
set nohlsearch                                          "Don't continue to highlight searched phrases.
set incsearch                                           "But do highlight as you type your search.
set ignorecase                                          "Ignore casing when searching
set smartcase                                           "When searching be smart about casing
" Wildmenu
set wildmenu                                            "Use wildmenu
set wildmode=longest:full,full                          "Wild mode for wildmenu
set wildignore=*.o,*.class,*.pyc,*.git                  "Wild menu to ignore compiled files

let g:ctrlp_working_path_mode = 'ra'                     "Open in current dir of file
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard'] " Ignore files in gitignore

""" KEY MAPPINGS """
" CtrlP keymap
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
" Easier way to enter new line
nnoremap <CR> i<CR><ESC>
" Easier to use tab than %
nnoremap <tab> %
vnoremap <tab> %
" Faster screen resizes
nnoremap <C-w>> 20<C-w>>
nnoremap <C-w>< 20<C-w><
nnoremap <C-w>+ 20<C-w>+
nnoremap <C-w>- 20<C-w>

""" VISUAL """
set showmatch	                    	                "Matching braces/brackets
set ruler	                        	                "Show file title
set number		                                        "Show absolute number on current line
set relativenumber                     	                "Relative numbering
let g:onedark_termcolors=256                            "Set onedark to use 256 colors
syntax on                                               "Syntax highlighting on 
colorscheme onedark                                     "Use onedark theme
hi MatchParen cterm=bold ctermbg=blue ctermfg=black     "Matching paren hightlight color change
hi LineNr ctermfg=darkGrey                              "Lighter line numbers from OneDark theme
hi CursorLineNr ctermfg=blue                            "Make current line number blue
set cursorline                                          "Shows a visual cursor line
hi CursorLine term=bold cterm=bold guibg=Grey40         "Light grey colour for cursorline
""" Airline settings"
let g:airline_theme='onedark'                           "Airline to use onedark theme
let g:airline_powerline_fonts = 1                       "Airline to use powerline font
set laststatus=2                                        "Used to see airline without opening split
set noshowmode                                          "Don't repeat vim modes in indicator
set ttimeoutlen=10                                      "Faster to exit insert mode
