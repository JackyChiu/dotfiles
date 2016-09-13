"""""""""""""""""""""""""""""
"""""	JackyChiu	"""""
"""""	Vim Dotfile	"""""
"""""""""""""""""""""""""""""

""" GENERAL """
set nocompatible	"Disable vi compatibility mode
filetype off		

""" VUNDLE """

"Set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'           "Vundle to install plugins
Plugin 'scrooloose/nerdtree'            "Project tree view
Plugin 'Valloric/YouCompleteMe'         "Minor autocompletions
Plugin 'christoomey/vim-tmux-navigator' "Vim-Tmux nagvagation
Plugin 'tpope/vim-surround'             "To add quotes and braces

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

""" VISUAL """
syntax enable
set showmatch	                    	                "Matching braces/brakcets
set ruler	                        	                "Show file title
set number		                                        "Show absolute number on current line
set relativenumber                     	                "Relative numbering
hi MatchParen cterm=bold ctermbg=blue ctermfg=black     "Matching paren hightlight color change

