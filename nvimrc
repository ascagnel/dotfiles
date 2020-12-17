set hidden
set clipboard=unnamed
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

Plug 'APZelos/blamer.nvim'
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
Plug 'plasticboy/vim-markdown'
Plug 'mhinz/vim-startify'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-dispatch'
Plug 'peitalin/vim-jsx-typescript'
Plug 'neoclide/coc.nvim', { 'branch': 'release' }
Plug 'peitalin/vim-jsx-typescript'
Plug 'leafgarland/typescript-vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
let g:coc_global_extensions = ['coc-tsserver', 'coc-emmet', 'coc-css', 'coc-html', 'coc-json', 'coc-yank', 'coc-prettier', 'coc-eslint']
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

if has('nvim')
    au FocusGained,BufEnter * :checktime
endif

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
set wildignore+=**/__generated__
set wildignore+=**/__snapshots__
set wildignore+=**/build

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
let g:ctrlp_root_markers=['.git/']
let g:rooter_patterns = ['.git/']
let g:ctrlp_max_files=0
let g:ctrlp_use_caching=5
let g:ctrlp_clear_cache_on_exit=0

let g:jsx_ext_required = 1 " Allow JSX in normal JS files

let g:javascript_plugin_jsdoc = 1

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

" mouse stuff
set mouse+=a
" if &term =~ '^screen'
    " set ttymouse=xterm2
" endif

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
au BufNewFile,BufRead *.ts setlocal filetype=typescript
au BufNewFile,BufRead *.tsx setlocal filetype=typescriptreact

let b:coc_root_patterns = [".git"]
au FileType typescript let b:coc_root_patterns = ['tsconfig.json']
au FileType typescript.tsx let b:coc_root_patterns = ['tsconfig.json']

if executable('ag')
  set grepprg=ag\ --vimgrep\ $*
  set grepformat=%f:%l:%c:%m
endif

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
let g:blamer_enabled = 1
let g:blamer_template = '<committer> <summary>'
let g:fzf_action = {
  \ 'enter': 'tab split',
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit'
  \ }
let g:typescript_indent_disable = 1
if filereadable($HOME . "/.nvimrc_local")
    source $HOME/.nvimrc_local
endif
