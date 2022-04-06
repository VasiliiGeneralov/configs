local capabilities = vim.lsp.protocol.make_client_capabilities()

capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)

local lspconfig = require('lspconfig')

lspconfig.clangd.setup {
  cmd = {
    'clangd-12',
    '--clang-tidy',
  },
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
    },
  },
  capabilities = capabilities,
}
