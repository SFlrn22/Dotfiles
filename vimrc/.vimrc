set mouse=a
syntax on
set number
set cursorline
:highlight Cursorline cterm=bold ctermbg=black
set hlsearch
set ignorecase
set smartcase

set tabstop=4
set softtabstop=4
set shiftwidth=4
set textwidth=79
set expandtab
set autoindent
set showmatch

if !has('gui_running')
	set t_Co=256
endif

set termguicolors
colorscheme catpuccin_mocha
