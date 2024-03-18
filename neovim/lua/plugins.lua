local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable',
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

vim.g.mapleader = ' '

local languages = {'cpp', 'c', 'python'}

return require('lazy').setup(
  {
    {
      'hrsh7th/nvim-cmp',
      dependencies = {
        'hrsh7th/cmp-nvim-lsp'
      },
    },
    {
      'p00f/clangd_extensions.nvim',
    },
    {
      'neovim/nvim-lspconfig',
      ft = languages,
      config = function()

        local has_words_before = function()
          local line, col = unpack(vim.api.nvim_win_get_cursor(0))
          return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match('%s') == nil
        end

        -- Set up lspconfig.
        local cmp = require('cmp')
        cmp.setup({
          sources = {{name = 'nvim_lsp'}},
          mapping = {
            ['<Tab>'] = function(fallback)
              if not cmp.select_next_item() then
                if vim.bo.buftype ~= 'prompt' and has_words_before() then
                  cmp.complete()
                else
                  fallback()
                end
              end
            end,
            ['<S-Tab>'] = function(fallback)
              if not cmp.select_prev_item() then
                if vim.bo.buftype ~= 'prompt' and has_words_before() then
                  cmp.complete()
                else
                  fallback()
                end
              end
            end,
          },
        })
        local capabilities = require('cmp_nvim_lsp').default_capabilities()

        -- Setup language servers.
        local lspconfig = require('lspconfig')
        lspconfig.pylsp.setup({capabilities = capabilities})
        lspconfig.clangd.setup({capabilities = capabilities})


        -- Global mappings.
        -- See `:help vim.diagnostic.*` for documentation on any of the below functions
        vim.keymap.set('n', '<space>e', vim.diagnostic.open_float)
        vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
        vim.keymap.set('n', ']d', vim.diagnostic.goto_next)
        vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist)

        -- Use LspAttach autocommand to only map the following keys
        -- after the language server attaches to the current buffer
        vim.api.nvim_create_autocmd('LspAttach', {
          group = vim.api.nvim_create_augroup('UserLspConfig', {}),
          callback = function(ev)
            -- Enable completion triggered by <c-x><c-o>
            vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

            -- Buffer local mappings.
            -- See `:help vim.lsp.*` for documentation on any of the below functions
            local opts = { buffer = ev.buf }
            vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
            vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
            vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
            vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
            vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
            vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, opts)
            vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, opts)
            vim.keymap.set('n', '<space>wl', function()
              print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
            end, opts)
            vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, opts)
            vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, opts)
            vim.keymap.set({ 'n', 'v' }, '<space>ca', vim.lsp.buf.code_action, opts)
            vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
            vim.keymap.set('n', '<space>f', function()
              vim.lsp.buf.format { async = true }
            end, opts)

            require('clangd_extensions.inlay_hints').setup_autocmd()
            require('clangd_extensions.inlay_hints').set_inlay_hints()
          end,
        })
      end,
    },
    {
      'nvim-treesitter/nvim-treesitter',
      build = ':TSUpdate',
      ft = languages,
      config = function()
        require('nvim-treesitter.configs').setup({
          highlight = {
            enable = true,
            additional_vim_regex_highlighting = false,
          },
        })
      end
    },
    {
      'nvim-treesitter/nvim-treesitter-context',
      ft = languages,
    },
    {
      'mfussenegger/nvim-lint',
      config = function()
        require('lint').linter_by_ft = {
          cpp = {'cpplint'},
          sh = {'shellcheck'},
        }
      end
    },
  },
  {
    defaults = {
      lazy = true,
    },
  }
)
