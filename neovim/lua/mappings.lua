vim.api.nvim_set_keymap('n', '<space>q', '<cmd>lua vim.diagnostic.open_float()<CR>', {})
vim.api.nvim_set_keymap('n', '<space>w', '<cmd>lua vim.lsp.buf.code_action()<CR>', {})
