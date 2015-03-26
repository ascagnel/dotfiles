set cul
hi CursorLine term=none cterm=none ctermbg=7
syntax on
set shiftwidth=4
set tabstop=4
set background=light

if has("autocmd")
	filetype plugin indent on
endif

set showcmd
set showmatch
set ignorecase
set smartcase
set incsearch
set hidden
set autoindent smartindent
set scrolloff=5
set sidescrolloff=5
set cmdheight=2

" Always show the status line
set laststatus=2

" Format the status line
set statusline=\ %F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l,%v
set number
