set nocompatible              " be iMproved, required
filetype off                  " required

" VUNDLE
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'Valloric/YouCompleteMe'
call vundle#end()
filetype plugin indent on

" VISUAL
syntax enable
"set t_Co=256
set background=dark
set expandtab
set shiftwidth=4
set tabstop=4
set softtabstop=4

"set smartindent
"set breakindent

" matching braces/brakcets
set showmatch
"Show currentline
"set modeline
" show file title
set ruler
if exists("+relativenumber")
    " Due to a problem with relative line numbers not persisting across new
    " tabs and splits, set no line numbers at all...
    set nonumber
    " ..then set relative ones.
    set relativenumber
" ...otherwise let’s just have regular ones.
else
    set number
endif
