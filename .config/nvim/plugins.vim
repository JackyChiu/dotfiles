"""PLUGINS """
call plug#begin()
Plug 'christoomey/vim-tmux-navigator'       "Vim-Tmux navigation
Plug 'tmux-plugins/vim-tmux-focus-events'   "Improve autoread in tmux!
Plug '/usr/local/opt/fzf'                   "Fuzzy finder
Plug 'junegunn/fzf.vim'                     "fzf vim funcs
Plug 'itchyny/lightline.vim'                "Powerline (lighter version)
Plug 'airblade/vim-gitgutter'               "Git additions and removals
Plug 'tpope/vim-fugitive'                   "Git wrapper for vim
Plug 'janko-m/vim-test'                     "Test runner
Plug 'benmills/vimux'                       "Open tmux window in vim
Plug 'sheerun/vim-polyglot'                 "Better syntax highlighting
Plug 'JackyChiu/vim-quantum'                "Quantum theme
" Autocomplete
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" Golang
Plug 'fatih/vim-go', { 'for': 'go', 'do': ':GoUpdateBinaries' }
"Live preview
Plug 'shime/vim-livedown', { 'do': 'npm install -g livedown', 'for': 'markdown' }
call plug#end()

"Colours
if has("termguicolors")
  set termguicolors
endif
colorscheme quantum

"Vimux
let g:VimuxOrientation = "h"
let g:VimuxHeight = "35"
nnoremap <leader>tq :VimuxCloseRunner<CR>

"Vim-test
let test#strategy = "vimux"
let test#go#gotest#options = {
  \ 'nearest': '-v',
  \ 'file':    '',
  \ 'suite':   '--race',
  \ }

nmap <leader>tn :TestNearest<CR>
nmap <leader>tf :TestFile<CR>
nmap <leader>ts :TestSuite<CR>
nmap <leader>tl :TestLast<CR>

"FZF
nnoremap <C-t> :FZF<CR>
" Find test file quickly
nnoremap <expr> <leader>tt ":FZF<CR>" . expand("%:t:r") . "_test"
nnoremap <C-b> :Buffers<CR>
let g:fzf_buffers_jump = 1              "[Buffers] Jump to the existing window if possible

"Vim-go
"More highlights!
let g:go_highlight_build_constraints = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_operators = 1
let g:go_highlight_structs = 1
let g:go_highlight_types = 1

let g:go_fmt_command = "goimports"        "Auto add imports
let g:go_def_mapping_enabled = 0          "Don't use C-t
let g:go_list_type = "quickfix"           "always use quickfix window
" disable vim-go :GoDef short cut (gd)
" this is handled by LanguageClient [LC]
let g:go_def_mapping_enabled = 0

au FileType go nmap <leader>r <Plug>(go-run)
au FileType go nmap <leader>b <Plug>(go-build)
au FileType go nmap <leader>tc <Plug>(go-test-compile)
au Filetype go nmap <leader>a <Plug>(go-alternate-edit)
au Filetype go nmap <leader>av <Plug>(go-alternate-vertical)
au FileType go nmap <leader>f :GoDeclsDir<CR>
au FileType go nmap <leader>rf :GoReferrers<CR>

"Lightline (copy pasta material)
let g:lightline = {
      \ 'colorscheme': 'quantum',
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
