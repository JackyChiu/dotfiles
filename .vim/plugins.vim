"""PLUGINS """
call plug#begin()
Plug 'christoomey/vim-tmux-navigator'       "Vim-Tmux navigation
Plug 'tmux-plugins/vim-tmux-focus-events'   "Improve autoread in tmux!
Plug '/usr/local/opt/fzf'                   "Fuzzy finder
Plug 'junegunn/fzf.vim'                     "fzf vim funcs
Plug 'sheerun/vim-polyglot'                 "Better syntax highlighting
Plug 'itchyny/lightline.vim'                "Powerline (lighter version)
Plug 'airblade/vim-gitgutter'               "Git additions and removals
Plug 'tpope/vim-surround'                   "Easy brace and quote changes
Plug 'tpope/vim-fugitive'                   "Git wrapper for vim
""Auto completions ;)
Plug 'Valloric/YouCompleteMe', { 'do': './install.py --all' }
"" Golang
Plug 'fatih/vim-go', { 'do': ':GoInstallBinaries', 'for': 'go' }
"Linter
Plug 'w0rp/ale', { 'for': 'js' }
"Live preview
Plug 'shime/vim-livedown', { 'do': 'npm install -g livedown', 'for': 'markdown' }
"Colors
Plug 'joshdick/onedark.vim'
call plug#end()
		  
"Colorscheme
colorscheme onedark

"Youcompleteme		
let g:ycm_autoclose_preview_window_after_completion = 1   "Close autocomplete preview window after completion

"FZF
nnoremap <C-t> :FZF<CR>
let g:fzf_buffers_jump = 1              "[Buffers] Jump to the existing window if possible
set grepprg=rg\ --vimgrep               "Use ripgrep

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
let g:go_auto_type_info = 1               "var type info
let g:go_list_type = "quickfix"           "always use quickfix window

au FileType go nmap <leader>r <Plug>(go-run)
au FileType go nmap <leader>R <Plug>(go-rename)<C-f>
au FileType go nmap <leader>b <Plug>(go-build)
au FileType go nmap <leader>t <Plug>(go-test)
au Filetype go nmap <leader>a <Plug>(go-alternate-edit)
au Filetype go nmap <leader>av <Plug>(go-alternate-vertical)
au FileType go nmap <leader>f :GoDeclsDir<CR>
au Filetype go nmap <leader>rf :GoReferrers<CR>
au FileType go nnoremap <buffer> <silent> gd :GoDef<CR>

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
