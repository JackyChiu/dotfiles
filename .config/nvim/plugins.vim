"""PLUGINS """
call plug#begin()
Plug 'christoomey/vim-tmux-navigator'       "Vim-Tmux navigation
Plug 'tmux-plugins/vim-tmux-focus-events'   "Improve autoread in tmux!
Plug '/usr/local/opt/fzf'                   "Fuzzy finder
Plug 'junegunn/fzf.vim'                     "fzf vim funcs
Plug 'sheerun/vim-polyglot', { 'tag': 'v3.3.1' }                 "Better syntax highlighting
Plug 'itchyny/lightline.vim'                "Powerline (lighter version)
Plug 'airblade/vim-gitgutter'               "Git additions and removals
Plug 'tpope/vim-surround'                   "Easy brace and quote changes
Plug 'tpope/vim-fugitive'                   "Git wrapper for vim
" Autocomplete
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
" Golang
Plug 'fatih/vim-go', { 'do': ':GoInstallBinaries', 'for': 'go' }
Plug 'zchee/deoplete-go', { 'for': 'go', 'do': 'make'}
"Linter
Plug 'w0rp/ale', { 'for': ['js', 'ruby', 'rust', 'elixir'] }
"Javascript/Typescript
Plug 'carlitux/deoplete-ternjs', { 'for': 'js', 'do': 'npm install -g tern' }
Plug 'peitalin/vim-jsx-typescript', { 'for': 'js' }
"Rubies
Plug 'tpope/vim-rails',  { 'for': 'ruby' }
Plug 'uplus/deoplete-solargraph', { 'for': 'ruby' }
" Rust
Plug 'rust-lang/rust.vim', { 'for': 'rust' }
Plug 'sebastianmarkow/deoplete-rust', { 'for': 'rust' }
" Elixir
Plug 'slashmili/alchemist.vim', { 'for': 'elixir' }
"Live preview
Plug 'shime/vim-livedown', { 'do': 'npm install -g livedown', 'for': 'markdown' }
"Themes
Plug 'joshdick/onedark.vim'
Plug 'arcticicestudio/nord-vim'
call plug#end()

"Colours
let g:nord_italic = 1
let g:nord_uniform_status_lines = 1
let g:nord_comment_brightness = 20
let g:nord_uniform_diff_background = 1
colorscheme nord

"Deoplete
let g:deoplete#enable_at_startup = 1
set completeopt-=preview

"Ale
let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_enter = 0

"Rust
let g:rustfmt_autosave = 1
let g:deoplete#sources#rust#racer_binary="/Users/jackychiu/.cargo/bin/racer"
let g:deoplete#sources#rust#rust_source_path="/Users/jackychiu/.rustup/toolchains/stable-x86_64-apple-darwin/lib/rustlib/src/rust/src"

"Elixir
let g:alchemist_tag_stack_map = '<C-s>' " don't mess with my fzf lol
let g:alchemist_iex_term_split = 'split'
au FileType elixir nmap <leader>r :IEx<CR>
au FileType elixir nnoremap <buffer> <silent>gd :ExDef<CR>

"FZF
nnoremap <C-t> :FZF<CR>
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

au FileType go nmap <leader>r <Plug>(go-run)
au FileType go nmap <leader>R <Plug>(go-rename)<C-f>
au FileType go nmap <leader>b <Plug>(go-build)
au FileType go nmap <leader>t <Plug>(go-test)
au Filetype go nmap <leader>a <Plug>(go-alternate-edit)
au Filetype go nmap <leader>av <Plug>(go-alternate-vertical)
au FileType go nmap <leader>f :GoDeclsDir<CR>
au FileType go nmap <leader>rf :GoReferrers<CR>
au FileType go nnoremap <buffer> <silent> gd :GoDef<CR>

"Lightline (copy pasta material)
let g:lightline = {
      \ 'colorscheme': 'nord',
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
