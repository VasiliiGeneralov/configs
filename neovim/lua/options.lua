local cmd = vim.cmd

cmd([[
augroup filetype
  au! BufRead,BufNewFile *.td set filetype=tablegen
augroup END
]])

local opt = vim.opt

opt.path = opt.path + "**"
