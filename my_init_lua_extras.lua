vim.pack.add({
  'https://github.com/nvim-treesitter/nvim-treesitter',
  'https://github.com/nvim-treesitter/nvim-treesitter-context',
})

require('nvim-treesitter').install {'c', 'cpp', 'python', 'json', }

vim.o.scrolloff = 0

vim.o.shiftwidth = 0
vim.o.tabstop = 2
vim.o.expandtab = true

vim.o.mouse = ''

vim.o.signcolumn = 'number'

vim.cmd[[set termguicolors]]
vim.cmd[[set background=dark]]
vim.cmd[[colorscheme vim]]

vim.cmd[[set completeopt+=menuone,noselect,popup]]

vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('my.lsp', {}),
  callback = function(args)
    local client = assert(vim.lsp.get_client_by_id(args.data.client_id))
    if client:supports_method('textDocument/completion') then
      local chars = {}; for i = 32, 126 do table.insert(chars, string.char(i)) end
      client.server_capabilities.completionProvider.triggerCharacters = chars
      vim.lsp.completion.enable(true, client.id, args.buf, {autotrigger = true})
    end
  end,
})

vim.keymap.set({'i'}, '<Tab>', function()
  return vim.fn.pumvisible() == 1 and "<C-n>" or "<Tab>"
end, { expr = true })

vim.keymap.set({'i'}, '<S-Tab>', function()
  return vim.fn.pumvisible() == 1 and "<C-p>" or "<S-Tab>"
end, { expr = true })

vim.keymap.set({'n'}, '<Leader>f', vim.lsp.buf.format)
vim.keymap.set({'n'}, '<Leader>e', vim.diagnostic.open_float)

vim.lsp.enable("clangd")
vim.lsp.enable("pylsp")

vim.cmd('packadd! termdebug')
