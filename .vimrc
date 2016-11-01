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

Plugin 'VundleVim/Vundle.vim'           "Vundle to install plugins
Plugin 'scrooloose/nerdtree'            "Project tree view
Plugin 'Valloric/YouCompleteMe'         "Autocompletions ;)
Plugin 'christoomey/vim-tmux-navigator' "Vim-Tmux nagvagation
Plugin 'tpope/vim-surround'             "To add quotes and braces
Plugin 'airblade/vim-gitgutter'         "Git addititons and removals
Plugin 'sheerun/vim-polyglot'           "Better syntax highlighing
Plugin 'vim-airline/vim-airline'        "Airline bar for vim
Plugin 'vim-airline/vim-airline-themes' "Need for airline themes to work
Plugin 'tpope/vim-fugitive'             "Git wrapper for vim

call vundle#end()
filetype plugin indent on

""" BEHAVIOUR """
set backspace=indent,eol,start                          "Add this to your vimrc to make the backspace work like in most other programs
set autoread                                            "Auto read changes outside of vim
set clipboard=unnamed		        	                "System Regiester to be same as unnamed
set tabstop=4 			            	                "Exisiting tabs to be shown with 4 spaces
set shiftwidth=4                                        "Size of indent
set softtabstop=4                                       "Backspace tab
set expandtab 			            	                "Tab to be 4 spaces
let g:ycm_autoclose_preview_window_after_completion = 1 "Close autocomplete preview window after completion
set backupdir=~/.vim/.backup                            "Dir for vim to save backup files
set directory=~/.vim/.swap                              "Dir for vim to save swap files
set nohlsearch                                          "Don't continue to highlight searched phrases.
set incsearch                                           "But do highlight as you type your search.
set wildmenu                                            "Use wildmenu
set wildmode=longest:full:full                          "Wild mode for whilemenu
set mouse=a                                             "Mouse click when just reading

""" KEY MAPPINGS """
" No need for shift key
nnoremap ; :
" Easier way to enter new line
nnoremap <CR> i<CR><ESC>
" Easier to use tab than %
nnoremap <tab> %
nnoremap <tab> %

""" VISUAL """
set showmatch	                    	                "Matching braces/brakcets
set ruler	                        	                "Show file title
set number		                                        "Show absolute number on current line
set relativenumber                     	                "Relative numbering
let g:onedark_termcolors=256                            "Set onedark to use 256 colors
syntax on                                               "Synax highlighting on 
colorscheme onedark                                     "Use onedark theme
hi MatchParen cterm=bold ctermbg=blue ctermfg=black     "Matching paren hightlight color change
hi CursorLineNr ctermfg=blue                            "Make current line number blue

""" Airline settings"
let g:airline_theme='onedark'                           "Airline to use onedark theme
let g:airline_powerline_fonts = 1                       "Airline to use powerline font
set laststatus=2                                        "Used to see airline without opening split
set noshowmode                                          "Don't repeat vim modes in indicator
set ttimeoutlen=10                                      "Faster to exit insert mode
