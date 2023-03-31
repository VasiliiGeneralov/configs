local capabilities = vim.lsp.protocol.make_client_capabilities()

capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

local lspconfig = require('lspconfig')

local opts = {
  noremap=true,
  silent=true,
}

local on_attach = function(client, bufnr)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>f', '<cmd>lua vim.lsp.buf.format({async = true})<CR>', opts)
end

lspconfig.clangd.setup {
  cmd = {
    'clangd',
    '--clang-tidy',
    '--background-index',
    '-j=4',
  },
  on_attach = on_attach,
  capabilities = capabilities,
}

lspconfig.pylsp.setup {
  cmd = {
    'pylsp',
  },
  pylsp = {
    plugins = {
      flake8 = {
        enabled = true,
      },
      mypy = {
        enabled = true,
      },
      black = {
        enabled = true,
      },
    },
  },
  on_attach = on_attach,
  capabilities = capabilities,
}
