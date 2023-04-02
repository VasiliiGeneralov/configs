local opt = vim.opt

opt.termguicolors = true
opt.number = true
opt.relativenumber = true
opt.showmode = true
opt.signcolumn = 'yes'
opt.cursorline = true
opt.laststatus = 1
opt.cmdheight = 0

local cmd = vim.cmd

cmd'colorscheme quiet'
cmd'match Error /\\s\\+$/'
cmd'2match Error /[^\\u0000-\\u007F]/'

opt.winbar = [[%{%v:lua.require('nvim-navic').get_location()%}]]
