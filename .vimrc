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

call vundle#end()
filetype plugin indent on

""" BEHAVIOUR """
set backspace=indent,eol,start          "Add this to your vimrc to make the backspace work like in most other programs
set clipboard=unnamed		        	"System Regiester to be same as unnamed
set tabstop=4 			            	"Exisiting tabs to be shown with 4 spaces
set shiftwidth=4                        "Size of indent
set expandtab 			            	"Tab to be 4 spaces

""" VISUAL """
syntax enable
set showmatch	                    	"Matching braces/brakcets
set ruler	                        	"Show file title
set number		                        "Show absolute number on current line
set relativenumber                     	"Relative numbering

