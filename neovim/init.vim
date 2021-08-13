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
call plug#begin('~/.vim/plugged/')
  Plug 'nanotech/jellybeans.vim'
  Plug 'bfrg/vim-cpp-modern'
  Plug 'dense-analysis/ale'
  Plug 'ycm-core/YouCompleteMe'
  Plug 'rust-lang/rust.vim'
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
let g:ale_cpp_clangtidy_executable = 'clang-tidy-12'
let g:ale_c_clangtidy_executable = 'clang-tidy-12'
let g:ale_cpp_cc_executable = 'clang++-12'
let g:ale_c_cc_executable = 'clang-12'
let g:ale_cpp_clangcheck_executable = 'clang-check-12'
let clangtidy_checks = [
      \'*',
      \'-llvmlibc-callee-namespace',
      \'-llvmlibc-restrict-system-libc-headers',
      \'-llvmlibc-implementation-in-namespace',
      \'-readability-convert-member-functions-to-static',
      \'-modernize-use-trailing-return-type',
      \'-fuchsia-default-arguments-calls'
      \]
let g:ale_cpp_cc_options = '-std=c++17 -Wall -Wextra -Wpedantic -Wunreachable-code'
let g:ale_c_cc_options = '-std=c18 -Wall -Wextra -Wpedantic -Wunreachable-code'
let g:ale_cpp_clangtidy_checks = clangtidy_checks
let g:ale_c_clangtidy_checks = clangtidy_checks
let g:ale_cpp_cppcheck_options = '--enable=all'
let g:ale_c_cppcheck_options = '--enable=all'
let g:ale_cpp_flawfinder_options = '--neverignore'
let g:ale_c_flawfinder_options = '--neverignore'
let g:ale_cpp_flawfinder_minlevel = 0
let g:ale_c_flawfinder_minlevel = 0
let g:ale_cpp_cpplint_options = '--linelength=120 --filter=+,-legal/copyright,-whitespace/comments'
let g:ale_linters = {
      \'cpp': ['cc', 'clangtidy', 'clangcheck', 'cppcheck', 'cpplint', 'flawfinder', 'clazy'],
      \'c': ['cc', 'clangtidy', 'cppcheck', 'cpplint', 'flawfinder', 'clazy'],
      \}
let g:ale_c_clangformat_executable = 'clang-format-12'
let g:ale_rust_rustfmt_options = '--config tab_spaces=2'
let g:ale_fixers = {
      \'cpp': ['clang-format'],
      \'c': ['clang-format'],
      \'cmake': ['cmakeformat'],
      \'rust': ['rustfmt']
      \}
autocmd FileType cpp autocmd BufWritePre * :ALEFix
autocmd FileType c autocmd BufWritePre * :ALEFix
autocmd FileType cmake autocmd BufWritePre * :ALEFix
autocmd FileType rust autocmd BufWritePre * :ALEFix

" ycm
let g:ycm_autoclose_preview_window_after_insertion = 1
let g:ycm_clangd_uses_ycmd_caching = 0
let g:ycm_clangd_binary_path = exepath("clangd-12")

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
autocmd BufWinLeave * mkview
autocmd BufWinEnter * silent! loadview
