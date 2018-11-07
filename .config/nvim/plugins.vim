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
Plug 'SirVer/ultisnips'                     "Snippet Engine
Plug 'honza/vim-snippets'                   "Language Snippets
Plug 'benmills/vimux'                       "Open tmux window in vim
Plug 'jparise/vim-graphql'                  "GraphQL highlighting
"Better syntax highlighting
Plug 'sheerun/vim-polyglot', { 'tag': 'v3.3.1' }
" Autocomplete
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
" Tabnine completeion
Plug 'tbodt/deoplete-tabnine', { 'for': ['ruby', 'java'], 'do': './install.sh' }
"" LSP client
Plug 'autozimu/LanguageClient-neovim', {
      \ 'branch': 'next',
      \ 'do': 'bash install.sh',
      \ }
"Linter
Plug 'w0rp/ale'
" Golang
Plug 'fatih/vim-go', { 'for': 'go', 'do': ':GoUpdateBinaries' }
Plug 'zchee/deoplete-go'
" Rust
Plug 'rust-lang/rust.vim', { 'for': 'rust' }
" Elixir
Plug 'slashmili/alchemist.vim', { 'for': 'elixir' }
"Live preview
Plug 'shime/vim-livedown', { 'do': 'npm install -g livedown', 'for': 'markdown' }
"Themes
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

"LSP Client
let g:LanguageClient_autoStop = 0
let g:LanguageClient_serverCommands = {
    \ 'ruby':           ['solargraph', 'stdio'],
    \ 'rust':           ['rustup', 'run', 'nightly', 'rls'],
    \ 'javascript':     ['javascript-typescript-stdio'],
    \ 'javascript.jsx': ['javascript-typescript-stdio'],
    \ 'typescript':     ['javascript-typescript-stdio'],
    \ }

nnoremap <silent> M :call LanguageClient_contextMenu()<CR>
nnoremap <silent> K :call LanguageClient#textDocument_hover()<CR>
nnoremap <silent> gd :call LanguageClient#textDocument_definition()<CR>
nnoremap <silent> <leader>R :call LanguageClient#textDocument_rename()<CR>

"Ale
let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_enter = 0
let g:ale_fix_on_save = 1
let g:ale_fixers = {
      \   'ruby': ['rubocop'],
      \   'javascript': ['eslint'],
      \}

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

"Rust
let g:rustfmt_autosave = 1
let g:deoplete#sources#rust#racer_binary="/Users/jackychiu/.cargo/bin/racer"
let g:deoplete#sources#rust#rust_source_path="/Users/jackychiu/.rustup/toolchains/stable-x86_64-apple-darwin/lib/rustlib/src/rust/src"

"Elixir
let g:alchemist_tag_stack_map = '<C-s>' " don't mess with my fzf lol
let g:alchemist_iex_term_split = 'split'
au FileType elixir nmap <leader>r :IEx<CR>
au FileType elixir nnoremap <buffer> <silent> gd :ExDef<CR>
au FileType elixir nnoremap <buffer> <silent> <C-]> :ExDef<CR>

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

au FileType go nmap <leader>r <Plug>(go-run)
au FileType go nmap <leader>R <Plug>(go-rename)<C-f>
au FileType go nmap <leader>b <Plug>(go-build)
au FileType go nmap <leader>tc <Plug>(go-test-compile)
au Filetype go nmap <leader>a <Plug>(go-alternate-edit)
au Filetype go nmap <leader>av <Plug>(go-alternate-vertical)
au FileType go nmap <leader>f :GoDeclsDir<CR>
au FileType go nmap <leader>rf :GoReferrers<CR>
au FileType go nnoremap <buffer> <silent> gd :GoDef<CR>
au FileType go nnoremap <buffer> <silent> <C-]> :GoDef<CR>

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
