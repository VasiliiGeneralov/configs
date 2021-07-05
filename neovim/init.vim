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

" vim plug plugins
call plug#begin('~/.config/nvim/plugged/')
  Plug 'nanotech/jellybeans.vim'
  Plug 'bfrg/vim-cpp-modern'
  Plug 'dense-analysis/ale'
  Plug 'ycm-core/YouCompleteMe'
call plug#end()

" jellybeans
colorscheme jellybeans
let g:jellybeans_use_term_italics = 0
let g:jellybeans_use_gui_italics = 0
let g:jellybeans_overrides = {'background': { 'guibg': '000000' }}

" vim cpp modern
let g:cpp_attributes_highlight = 1
let g:cpp_member_highlight = 1

" ale
let g:ale_linters = {'cpp': ['clangtidy', 'cppcheck', 'cpplint', 'flawfinder']}
let g:ale_linters = {'c': ['clangtidy', 'cppcheck', 'cpplint', 'flawfinder']}

" ycm
let g:ycm_autoclose_preview_window_after_insertion = 1
" Let clangd fully control code completion
let g:ycm_clangd_uses_ycmd_caching = 0
" Use installed clangd, not YCM-bundled clangd which doesn't get updates.
let g:ycm_clangd_binary_path = exepath("clangd-12")

function FormatFile()
  let l:lines="all"
  py3f ~/llvm-project/clang/tools/clang-format/clang-format.py
endfunction
autocmd BufWritePre *.h,*.hpp,*.c,*.cc,*.cpp call FormatFile()

" filetype detection
filetype on
filetype plugin on
filetype indent on

" syntax highlighting
syntax enable
syntax on

" trailing spaces
:match Error /\s\+$/

" folds
au BufWinLeave * mkview
au BufWinEnter * silent! loadview
