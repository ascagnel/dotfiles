set hidden
filetype off

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'airblade/vim-gitgutter'
Plugin 'mxw/vim-jsx'
Plugin 'pangloss/vim-javascript'
Plugin 'cakebaker/scss-syntax.vim'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'mhinz/vim-startify'
Plugin 'bling/vim-airline'
Plugin 'tpope/vim-obsession'
Plugin 'Konfekt/FastFold'
Plugin 'joonty/vdebug'
Plugin 'ervandew/supertab'
Plugin 'jparise/vim-graphql'
Plugin 'w0rp/ale'
Plugin 'ryanss/vim-hackernews'
Plugin 'flazz/vim-colorschemes'
Plugin 'airblade/vim-rooter'
Plugin 'lepture/vim-jinja'
Plugin 'junegunn/fzf'
Plugin 'junegunn/fzf.vim'
Plugin 'scrooloose/nerdtree'
" If a system-specific file is present, load that before ending vundle
if filereadable($HOME . "/.nvimrc_local_packages")
    so ~/.nvimrc_local
endif

call vundle#end()            " required
filetype plugin indent on    " required

colorscheme Tomorrow-Night-Eighties
highlight Normal ctermbg=none

"set cul
"hi CursorLine term=none cterm=none ctermbg=255
set cursorline
set background="dark"

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

set backupdir=~/.vim/files/backupdir//
set directory=~/.vim/files/swapdir//
set undodir=~/.vim/files/undodir//

" Always show the status line
set laststatus=2

" Format the status line
set statusline=\ %m%f\ %{ALEGetStatusLine()}\ \(\%l,%v\)
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

map! jk <Esc>

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

augroup reload_vimrc " {
    autocmd!
    autocmd BufWritePost $MYVIMRC source $MYVIMRC
augroup END " }

let g:testdrive#detect = 1
let g:testdrive#use_dispatch = 1
let g:testdrive#always_open_results = 0

" mouse stuff
set mouse+=a
if &term =~ '^screen'
    set ttymouse=xterm2
endif

" airline
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#branch#enabled = 0
let g:airline#extensions#tabline#show_tabs = 1
let g:airline#extensions#tabline#show_tab_nr = 0
let g:airline#extensions#tabline#buffer_nr_show = 0
let g:airline#extensions#tabline#show_close_button = 0

let g:flow#autoclose = 1

set secure

nmap [c <Plug>GitGutterPrevHunk
nmap ]c <Plug>GitGutterNextHunk

nmap <Leader>hs <Plug>GitGutterStageHunk
nmap <Leader>hr <Plug>GitGutterRevertHunk
nmap <Leader>hp <Plug>GitGutterPreviewHunk
nmap <Leader>f <Plug>Files<CR>

let g:deoplete#enable_at_startup = 1

set runtimepath^=~/.vim/bundle/ctrlp.vim

let g:ale_linters = {'jsx': ['eslint', 'flow'], 'javascript': ['eslint', 'flow'], 'js': ['eslint', 'flow']}
let g:ale_statusline_format = ['⨉ %d', '⚠ %d', '⬥ ok']
let g:ale_javascript_eslint_options = '--env es6 --env jest --rule "sourceType: module"'

augroup FiletypeGroup
    autocmd!
    au BufNewFile,BufRead *.jsx set filetype=javascript.jsx
augroup END

au BufNewFile,BufRead *.html,*.htm,*.shtml,*.stm,*.nunjucks,*.twig set ft=jinja

if filereadable($HOME . "/.nvimrc_local")
    so ~/.nvimrc_local
endif
hi Normal guibg=NONE ctermbg=NONE
hi LineNr guifg=grey ctermfg=grey
let macvim_skip_colorscheme=1

