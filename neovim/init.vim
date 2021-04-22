" vim mode
set nocompatible
set wildmenu

" string numbers
set number
set relativenumber

" encoding
set encoding=utf-8
scriptencoding utf-8
set fileencoding=utf-8
set termencoding=utf-8

" searching
set hlsearch
set incsearch
set smartcase
set path+=**

" appearance
set termguicolors
set showmode
set showcmd
set signcolumn=yes
set cursorline
set laststatus=1

" indentation
set autoindent
set smartindent
set smarttab
set shiftwidth=2
set softtabstop=2
set expandtab

" bell
set belloff=all
set noerrorbells
set novisualbell

" map ansi qwerty and йцукен
set langmap=ФИСВУАПРШОЛДЬТЩЗЙКЫЕГМЦЧНЯ;ABCDEFGHIJKLMNOPQRSTUVWXYZ,фисвуапршолдьтщзйкыегмцчня;abcdefghijklmnopqrstuvwxyz

" vim plug plugins
call plug#begin('~/.config/nvim/plugged/')
  Plug 'nanotech/jellybeans.vim'
  Plug 'bfrg/vim-cpp-modern', { 'for': ['c', 'cpp'] }
  Plug 'pboettch/vim-cmake-syntax', { 'for': 'cmake' }
  Plug 'Chiel92/vim-autoformat', { 'for': ['cmake', 'qml', 'python', 'json', 'pascal'] }
  Plug 'luochen1990/rainbow', { 'for': ['c', 'cpp'] }
  Plug 'ycm-core/YouCompleteMe'
  Plug 'dense-analysis/ale'
  Plug 'rhysd/vim-clang-format', { 'for': ['c', 'cpp'] }
  Plug 'peterhoeg/vim-qml', { 'for': 'qml' }
  Plug 'kergoth/vim-bitbake',{ 'for': 'bitbake' }
call plug#end()

" jellybeans
colorscheme jellybeans
set background=dark
let g:jellybeans_use_term_italics = 0
let g:jellybeans_use_gui_italics = 0

" vim cpp modern
let c_no_curly_error = 1
let g:cpp_named_requirements_highlight = 1

" rainbow
let g:rainbow_active = 1

" ultisnips

" you complete me
let g:ycm_autoclose_preview_window_after_completion = 1

" ale
let g:ale_completion_enabled = 0

" clang format
autocmd FileType c,cpp ClangFormatAutoEnable

" filetype detection
filetype on
filetype plugin on
filetype indent on

" syntax highlighting
syntax enable
syntax on
