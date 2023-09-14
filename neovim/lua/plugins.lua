return require('packer').startup(function()
  use {
    'wbthomason/packer.nvim',
  }
  use {
    'neovim/nvim-lspconfig',
    config = [[ require('configs.nvim_lspconfig') ]],
  }
  use {
    'hrsh7th/cmp-nvim-lsp',
    requires = {
      'hrsh7th/nvim-cmp'
    },
    config = [[ require('configs.cmp_nvim_lsp') ]],
  }
  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate',
    config = [[ require('configs.nvim_treesitter') ]],
  }
  use {
    'nvim-treesitter/nvim-treesitter-context',
  }
  use {
    use 'mfussenegger/nvim-lint',
    config = [[ require('configs.nvim_lint') ]],
  }
end)
