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

Plugin 'VundleVim/Vundle.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'eparreno/vim-l9'
Plugin 'vim-scripts/FuzzyFinder'
Plugin 'Valloric/YouCompleteMe'

call vundle#end()
filetype plugin indent on

""" BEHAVIOUR """
set backspace=indent,eol,start		"Add this to your vimrc to make the backspace work like in most other programs

""" VISUAL """
syntax enable
set showmatch		"Matching braces/brakcets
set ruler		"Show file title
set number		"Show absolute number on current line
set relativenumber	"Relative numbering

