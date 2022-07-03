local opt = vim.opt

opt.termguicolors = true
opt.number = true
opt.relativenumber = true
opt.showmode = true
opt.signcolumn = 'yes'
opt.cursorline = true
opt.laststatus = 1
opt.cmdheight = 0

local g = vim.g

g.jellybeans_use_term_italics = 0
g.jellybeans_use_gui_italics = 0
g.jellybeans_overrides = {
  background = {
    guibg = '000000',
  },
}

local cmd = vim.cmd

cmd'colorscheme jellybeans'
cmd'match Error /\\s\\+$/'
