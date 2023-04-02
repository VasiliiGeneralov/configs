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
    'SmiteshP/nvim-navic',
    requires = {
      'neovim/nvim-lspconfig',
    },
    config = [[ require('configs.nvim_navic') ]],
  }
end)
