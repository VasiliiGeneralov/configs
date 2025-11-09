set number
set relativenumber

set shiftwidth=0
set tabstop=2
set expandtab

let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
set background=dark
set termguicolors

match Error /\s\+$/
2match Error /\t\+/

let g:mapleader = "\<Space>"

autocmd FileType c,cpp setlocal formatprg='clang-format'
autocmd FileType python setlocal formatprg='yapf'

noremap <Leader>f gggqG<C-o><C-o>

packadd! termdebug
let g:termdebug_wide = 1
