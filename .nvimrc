set hidden
filetype off

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'airblade/vim-gitgutter'
Plugin 'tpope/vim-fugitive.git'
Plugin 'mxw/vim-jsx'
Plugin 'pangloss/vim-javascript'
Plugin 'cakebaker/scss-syntax.vim'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'mhinz/vim-startify'
Plugin 'tpope/vim-obsession'
Plugin 'ervandew/supertab'
Plugin 'jparise/vim-graphql'
Plugin 'w0rp/ale'
Plugin 'airblade/vim-rooter'
Plugin 'lepture/vim-jinja'
Plugin 'sbdchd/neoformat'
Plugin 'mileszs/ack.vim'
Plugin 'bfontaine/Brewfile.vim'
call vundle#end()            " required
filetype plugin indent on    " required

syntax on
colorscheme default
set foldmethod=syntax
set foldlevel=99
let v:foldlevel=99
set shiftwidth=4
set tabstop=4

if has("autocmd")
	filetype plugin indent on
endif

set relativenumber
set showcmd
set showmatch
set ignorecase
set smartcase
set incsearch
set scrolloff=5
set sidescrolloff=5
set cmdheight=2
set autoread
set autochdir
set exrc

set backupdir=~/.vim/files/backupdir//
set directory=~/.vim/files/swapdir//
set undodir=~/.vim/files/undodir//

" Always show the status line
set laststatus=2

" Format the status line
function! LinterStatus() abort
    let l:counts = ale#statusline#Count(bufnr(''))

    let l:all_errors = l:counts.error + l:counts.style_error
    let l:all_non_errors = l:counts.total - l:all_errors

    return l:counts.total == 0 ? 'OK' : printf(
    \   '%dW %dE',
    \   all_non_errors,
    \   all_errors
    \)
endfunction
set statusline=\ %m%f\ %{LinterStatus()}\ \(\%l,%v\)
set number

set expandtab
set tabstop=4
set shiftwidth=4
set eol
set nolist

set wildignore+=**/node_modules
set wildignore+=**/public
set wildignore+=**/dist
set wildignore+=**/coverage
set wildignore+=**/assets/c
set wildignore+=**/__generated__
set wildignore+=**/__snapshots__

map! jk <Esc>
map! jj <Esc>

" CtrlP -- default new tab
let g:ctrlp_prompt_mappings = {
    \ 'AcceptSelection("e")': ['<c-t>'],
    \ 'AcceptSelection("t")': ['<cr>', '<2-LeftMouse>'],
    \ 'PrtClearCache()': ['<F6>', '<c-r>'],
    \ }

let g:ctrlp_cache_dir= $HOME.'/.vim/caches'
let g:ctrlp_max_depth=45
let g:ctrlp_working_path_mode='r'
let g:ctrlp_lazy_update = 1
let g:ctrlp_root_markers=['package.json','.git', 'dibs']
let g:ctrlp_max_files=0
let g:ctrlp_use_caching=5
let g:ctrlp_clear_cache_on_exit=0

let g:jsx_ext_required = 1 " Allow JSX in normal JS files

let g:javascript_plugin_jsdoc = 1
let g:used_javascript_libs = 'underscore,backbone,react,flux'

let g:startify_list_order = [
            \ ['  Bookmarks '], 'bookmarks',
            \ ['  MRU '],       'files',
            \ ['  MRU DIR '],   'dir',
            \ ]

let g:startify_change_to_vcs_root     = 1
let g:startify_change_to_dir          = 0
let g:startify_enable_special         = 0
let g:startify_files_number           = 8
let g:startify_session_autoload       = 1
let g:startify_session_delete_buffers = 1
let g:startify_session_persistence    = 1
let g:startify_session_savecmds = [
            \ 'Obsession'
            \ ]

let g:testdrive#detect = 1
let g:testdrive#use_dispatch = 1
let g:testdrive#always_open_results = 0

" mouse stuff
set mouse+=a
if &term =~ '^screen'
    set ttymouse=xterm2
endif

let g:flow#autoclose = 1

set secure

set updatetime=100
nmap [c <Plug>GitGutterPrevHunk
nmap ]c <Plug>GitGutterNextHunk

nmap <Leader>hs <Plug>GitGutterStageHunk
nmap <Leader>hr <Plug>GitGutterRevertHunk
nmap <Leader>hp <Plug>GitGutterPreviewHunk

let g:deoplete#enable_at_startup = 1

set runtimepath^=~/.vim/bundle/ctrlp.vim

augroup FiletypeGroup
    autocmd!
    au BufNewFile,BufRead *.jsx set filetype=javascript.jsx
augroup END

au BufNewFile,BufRead *.html,*.htm,*.shtml,*.stm,*.nunjucks,*.twig set ft=jinja

if filereadable($HOME . "/.nvimrc_local")
    so ~/.nvimrc_local
endif

if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif
