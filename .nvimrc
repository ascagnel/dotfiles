set hidden
set clipboard+=unnamedplus
filetype off

if has('nvim')
    if empty(glob('$XDG_CONFIG_HOME/nvim/autoload/plug.vim'))
      silent !curl -fLo $XDG_CONFIG_HOME/nvim/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
      autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
    endif
    call plug#begin('$XDG_CONFIG_HOME/nvim/plugged')
else
    if empty(glob('$HOME/.vim/autoload/plug.vim'))
      silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
      autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
    endif
    call plug#begin('$HOME/.vim/plugged')
endif

Plug 'bfontaine/Brewfile.vim'
Plug 'janko-m/vim-test'
Plug 'airblade/vim-gitgutter'
Plug 'mxw/vim-jsx'
Plug 'pangloss/vim-javascript'
Plug 'cakebaker/scss-syntax.vim'
Plug 'tpope/vim-obsession'
Plug 'ervandew/supertab'
Plug 'jparise/vim-graphql'
Plug 'airblade/vim-rooter'
Plug 'mileszs/ack.vim'
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'
Plug 'mhinz/vim-startify'
Plug 'tpope/vim-fugitive'
Plug '/usr/local/opt/fzf'
Plug 'tpope/vim-dispatch'
Plug 'peitalin/vim-jsx-typescript'
Plug 'HerringtonDarkholme/yats.vim'
Plug 'mhartington/nvim-typescript', {'do': ':!install.sh \| UpdateRemotePlugins', 'for': ['typescript', 'tsx'] }
if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
  Plug 'Shougo/deoplete.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif
let g:deoplete#enable_at_startup = 1
" For Denite features
Plug 'Shougo/denite.nvim'
call plug#end()            " required
filetype plugin indent on    " required

set noswapfile

let g:loaded_matchit = 1
syntax on

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

au FocusGained,BufEnter * :checktime

set backupdir=~/.vim/files/backupdir//
set directory=~/.vim/files/swapdir//
set undodir=~/.vim/files/undodir//

" Always show the status line
set laststatus=2

set statusline=\ %m%f\ \(\%l,%v\)
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
let g:fzf_action = {
  \ 'enter': 'tab split',
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit'
  \ }

let g:ctrlp_cache_dir= $HOME.'/.vim/caches'
let g:ctrlp_max_depth=45
let g:ctrlp_working_path_mode='r'
let g:ctrlp_lazy_update = 1
let g:ctrlp_root_markers=['package.json', '.git/']
let g:rooter_patterns = ['package.json', '.git/']
let g:ctrlp_max_files=0
let g:ctrlp_use_caching=5
let g:ctrlp_clear_cache_on_exit=0

let g:jsx_ext_required = 1 " Allow JSX in normal JS files

let g:javascript_plugin_jsdoc = 1
let g:used_javascript_libs = 'underscore,backbone,react,flux'

let g:startify_list_order = [
            \ ['  Bookmarks '], 'bookmarks',
            \ ['  Sessions'], 'sessions',
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
" if &term =~ '^screen'
    " set ttymouse=xterm2
" endif

" let g:flow#autoclose = 1
" let g:javascript_plugin_flow = 1

set secure

set updatetime=100
nmap [c <Plug>(GitGutterPrevHunk)
nmap ]c <Plug>(GitGutterNextHunk)

nmap <Leader>hs <Plug>(GitGutterStageHunk)
nmap <Leader>hr <Plug>(GitGutterRevertHunk)
nmap <Leader>hp <Plug>(GitGutterPreviewHunk)

" set runtimepath^=~/.vim/bundle/ctrlp.vim

augroup FiletypeGroup
    autocmd!
    au BufNewFile,BufRead *.jsx set filetype=javascript.jsx
augroup END

au BufNewFile,BufRead *.html,*.htm,*.shtml,*.stm,*.nunjucks,*.twig set ft=jinja

if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif

let test#strategy = "terminal"
tnoremap <C-h> <C-\><C-N><C-w>h
tnoremap <C-j> <C-\><C-N><C-w>j
tnoremap <C-k> <C-\><C-N><C-w>k
tnoremap <C-l> <C-\><C-N><C-w>l
tnoremap <Esc> <C-\><C-n>
tnoremap jk <C-\><C-n>

inoremap <C-h> <C-\><C-N><C-w>h
inoremap <C-j> <C-\><C-N><C-w>j
inoremap <C-k> <C-\><C-N><C-w>k
inoremap <C-l> <C-\><C-N><C-w>l
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

nnoremap <C-p> :FZF<CR>

" make test commands execute using dispatch.vim
let test#strategy = "dispatch"

if filereadable($HOME . "/.nvimrc_local")
    source $HOME/.nvimrc_local
endif
let g:typescript_compiler_binary = 'yarn'
let g:typescript_compiler_options = 'type:check'
