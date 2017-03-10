set hidden
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'airblade/vim-gitgutter'
Plugin 'mxw/vim-jsx'
Plugin 'pangloss/vim-javascript'
Plugin 'dracula/vim'
Plugin 'scrooloose/nerdtree'
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'cakebaker/scss-syntax.vim'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'mhinz/vim-startify'
Plugin 'evidens/vim-twig.git'
Plugin 'tpope/vim-dispatch.git'
Plugin 'tpope/vim-fugitive'
Plugin 'jlanzarotta/bufexplorer'
Plugin 'tpope/vim-surround.git'
Plugin 'monokrome/vim-testdrive'
Plugin 'kien/rainbow_parentheses.vim'
Plugin 'airblade/vim-rooter'
Plugin 'gregsexton/gitv'
Plugin 'bling/vim-airline'
Plugin 'xolox/vim-misc'
Plugin 'plasticboy/vim-markdown'
Plugin 'tpope/vim-obsession'
Plugin 'Konfekt/FastFold'
Plugin 'joonty/vdebug'
Plugin 'ervandew/supertab'
Plugin 'jparise/vim-graphql'
Plugin 'yuttie/comfortable-motion.vim'
Plugin 'easymotion/vim-easymotion'
Plugin 'w0rp/ale'

" If a system-specific file is present, load that before ending vundle
if filereadable($HOME . "/.nvimrc_local")
    so ~/.nvimrc_local
endif

call vundle#end()            " required
filetype plugin indent on    " required

" noremap <silent> <c-u> :call smooth_scroll#up(&scroll, 0, 2)<CR>
" noremap <silent> <c-d> :call smooth_scroll#down(&scroll, 0, 2)<CR>
" noremap <silent> <c-b> :call smooth_scroll#up(&scroll*2, 0, 4)<CR>
" noremap <silent> <c-f> :call smooth_scroll#down(&scroll*2, 0, 4)<CR>

set cul
hi CursorLine term=none cterm=none ctermbg=255
"set cursorline
set background="dark"

syntax on
set foldmethod=syntax
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
set statusline=\ %m%f\ %{fugitive#statusline()}\ %{ALEGetStatusLine()}\ \(\%l,%v\)
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
set wildignore+=**/npmtmp
set wildignore+=**/dist
set wildignore+=**/.npmtmp
set wildignore+=**/coverage

map! jk <Esc>
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

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

let g:javascript_plugin_jsdoc = 1
let g:used_javascript_libs = 'underscore,backbone,react,flux'

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

colorscheme Tomorrow-Night-Eighties

" airline
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#branch#enabled = 0
let g:airline#extensions#tabline#show_tabs = 1
let g:airline#extensions#tabline#show_tab_nr = 0
let g:airline#extensions#tabline#buffer_nr_show = 0
let g:airline#extensions#tabline#show_close_button = 0

set secure

nmap [c <Plug>GitGutterPrevHunk
nmap ]c <Plug>GitGutterNextHunk

nmap <Leader>hs <Plug>GitGutterStageHunk
nmap <Leader>hr <Plug>GitGutterRevertHunk
nmap <Leader>hp <Plug>GitGutterPreviewHunk

nmap <Leader>w <Plug>(easymotion-bd-w)
nmap <Leader>W <Plug>(easymotion-bd-W)
nmap <Leader>t <Plug>(easymotion-bd-t)
nmap <Leader>T <Plug>(easymotion-bd-T)
nmap <Leader>j <Plug>(easymotion-j)
nmap <Leader>k <Plug>(easymotion-k)
nmap <Leader>/ <Plug>(easymotion-bd-n)
nmap <Leader>? <Plug>(easymotion-bd-N)
nmap <Leader>s <Plug>(easymotion-s)
let g:EasyMotion_smartcase = 1

let g:deoplete#enable_at_startup = 1

let g:tagman_auto_generate = 1
" let g:tagman_ctags_binary = 'ctags -a ./.git/tags -R ./src'
let g:tagman_ignores = ['node_modules', 'dist']

let g:SuperTabDefaultCompletionType = "<c-n>"

set tags=./tags;,tags;
set runtimepath^=~/.vim/bundle/ctrlp.vim

let g:ale_linters = {'jsx': ['eslint'], 'javascript': ['eslint'], 'js': ['eslint']}
let g:ale_statusline_format = ['⨉ %d', '⚠ %d', '⬥ ok']
let g:ale_javascript_eslint_options = '--env es6 --env jest'

augroup FiletypeGroup
    autocmd!
    au BufNewFile,BufRead *.jsx set filetype=javascript.jsx
augroup END
