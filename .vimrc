"""""""""""""""""""""""""""""
"""""	  JackyChiu	      """""
"""""	  Vim Dotfile	    """""
"""""""""""""""""""""""""""""

"""PLUGINS"""
source ~/.vim/plugins.vim

"""BEHAVIOUR"""
"General
set autoread														"Auto read changes outside of vim
set clipboard=unnamed		        	    	"System register to be same as unnamed
set mouse=a                           	"Mouse click when just reading
set ttimeoutlen=10                      "Faster to exit insert mode
set exrc                                "Allow for project specific vimrc
set ma                                  "Allow jump to quickfix files

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

"""KEY MAPPINGS"""
"Faster screen resizes
nnoremap <C-w>> 20<C-w>>
nnoremap <C-w>< 20<C-w><
nnoremap <C-w>+ 20<C-w>+
nnoremap <C-w>- 20<C-w>

"Enter to enter new line
nnoremap <CR> i<CR><ESC>

"I do :W all the time
command! W w
command! Wq wq

"Quickfix window movement
map <C-n> :cnext<CR>
map <C-p> :cprevious<CR>

"""FILE SPECIFIC"""
"Set spell for these files
au FileType gitcommit setlocal spell
au FileType markdown setlocal spell

au BufNewFile,BufRead *.java
      \ nnoremap <leader>b :!javac %<CR> |
      \ nnoremap <leader>r :!java -ea %:r<CR>

set secure                "Disable unsafe commands in project vimrcs
