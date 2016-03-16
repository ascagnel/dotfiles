set hidden
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'airblade/vim-gitgutter'
Plugin 'mxw/vim-jsx'
Plugin 'othree/yajs.vim'
"Plugin 'othree/javascript-libraries-syntax.vim'
"Plugin 'othree/es.next.syntax.vim'
Plugin 'pangloss/vim-javascript'
Plugin 'scrooloose/nerdtree'
"Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'cakebaker/scss-syntax.vim'
Plugin 'flazz/vim-colorschemes'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'mklabs/vim-backbone.git'
Plugin 'nathanaelkane/vim-indent-guides.git'
Plugin 'mhinz/vim-startify'
Plugin 'ryanss/vim-hackernews'
Plugin 'evidens/vim-twig.git'
Plugin 'tpope/vim-dispatch.git'
Plugin 'tpope/vim-fugitive'
Bundle 'jlanzarotta/bufexplorer'
Plugin 'easymotion/vim-easymotion'
Plugin 'tpope/vim-surround.git'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'mileszs/ack.vim'
Plugin 'monokrome/vim-testdrive'
Plugin 'kien/rainbow_parentheses.vim'
"Plugin 'Valloric/YouCompleteMe'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'gregsexton/gitv'
Plugin 'bling/vim-airline'
Plugin 'xolox/vim-easytags'
Plugin 'xolox/vim-misc'
call vundle#end()            " required
filetype plugin indent on    " required

set cul
hi CursorLine term=none cterm=none ctermbg=234
"set cursorline

set clipboard+=unnamed

syntax on
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
set statusline=\ %m%f\ %{fugitive#statusline()}\ \(\%l,%v\)
set number

set expandtab
set tabstop=4
set shiftwidth=4
set eol
set nolist

set wildignore+=**/node_modules
set wildignore+=**/public
set wildignore+=**/\.npmtmp
set wildignore+=**/public
set wildignore+=**/coverage

" CtrlP -- default new tab
let g:ctrlp_prompt_mappings = {
    \ 'AcceptSelection("e")': ['<c-t>'],
    \ 'AcceptSelection("t")': ['<cr>', '<2-LeftMouse>'],
    \ }

let g:ctrlp_cache_dir= $HOME.'/.vim/caches'
let g:ctrlp_max_depth=45
let g:ctrlp_working_path_mode='r'
let g:ctrlp_lazy_update = 1
let g:ctrlp_root_markers=['package.json','.git']
let g:ctrlp_max_files=0
let g:ctrlp_use_caching=5
let g:ctrlp_clear_cache_on_exit=0

let g:jsx_ext_required = 1 " Allow JSX in normal JS files

let g:ack_use_dispatch = 1
let g:ackhighlight = 1
let g:ackpreview = 1
let g:ack_default_options =
            \ " -s -H --nocolor --nogroup --column --smart-case --follow"
            \ "--ignore-dir {node_modules,public,npmrc}"

" let g:ag_working_path_mode="r"

let g:used_javascript_libs = 'underscore,backbone,react,flux'

let g:syntastic_javascript_checkers = [ 'eslint' ]
let g:syntastic_javascript_eslint_blockBindings = "true"

let g:startify_list_order = [
            \ ['  Sessions '],  'sessions',
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

function! ESLintArgs()
    let rules = findfile('index.js', '.;~/projects/eslint-config-1stdibs')
    return rules != '' ? '--rulesdir ' . shellescape(fnamemodify(rules, ':p:h')) : ''
endfunction

autocmd FileType javascript let b:syntastic_javascript_eslint_args = ESLintArgs()

augroup reload_vimrc " {
    autocmd!
    autocmd BufWritePost $MYVIMRC source $MYVIMRC
augroup END " }

let g:testdrive#detect = 1
let g:testdrive#use_dispatch = 1
let g:testdrive#always_open_results = 1

" mouse stuff
set mouse+=a
if &term =~ '^screen'
    set ttymouse=xterm2
endif

" rainbow parens
let g:rbpt_colorpairs = [
    \ ['brown',       'RoyalBlue3'],
    \ ['Darkblue',    'SeaGreen3'],
    \ ['darkgray',    'DarkOrchid3'],
    \ ['darkgreen',   'firebrick3'],
    \ ['darkcyan',    'RoyalBlue3'],
    \ ['darkred',     'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['brown',       'firebrick3'],
    \ ['gray',        'RoyalBlue3'],
    \ ['black',       'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['Darkblue',    'firebrick3'],
    \ ['darkgreen',   'RoyalBlue3'],
    \ ['darkcyan',    'SeaGreen3'],
    \ ['darkred',     'DarkOrchid3'],
    \ ['red',         'firebrick3'],
    \ ]
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces

" airline
let g:airline_powerline_fonts = 1

set secure

nmap [c <Plug>GitGutterPrevHunk
nmap ]c <Plug>GitGutterNextHunk

nmap <Leader>hs <Plug>GitGutterStageHunk
nmap <Leader>hr <Plug>GitGutterRevertHunk
nmap <Leader>hp <Plug>GitGutterPreviewHunk

set runtimepath^=~/.vim/bundle/ctrlp.vim
