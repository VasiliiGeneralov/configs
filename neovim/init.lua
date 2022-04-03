require'nvim-treesitter.configs'.setup {
	highlight = {
		enable = true,
		additional_vim_regex_highlighting = false,
	},
}

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)

require'lspconfig'.clangd.setup{
	cmd = {
		'clangd-12',
		'--clang-tidy',
	},
	capabilities = capabilities,
}

local has_words_before = function()
	local line, col = unpack(vim.api.nvim_win_get_cursor(0))
	return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match('%s') == nil
end

require'cmp'.setup {
	sources = {
		{
			name = 'nvim_lsp',
		},
	},
	mapping = {
		['<Tab>'] = function(fallback)
			if not require'cmp'.select_next_item() then
				if vim.bo.buftype ~= 'prompt' and has_words_before() then
					require'cmp'.complete()
				else
					fallback()
				end
			end
		end,
		['<S-Tab>'] = function(fallback)
			if not require'cmp'.select_prev_item() then
				if vim.bo.buftype ~= 'prompt' and has_words_before() then
					require'cmp'.complete()
				else
					fallback()
				end
			end
		end,
	},
}

return require('packer').startup(function()
	use 'wbthomason/packer.nvim'
	use {
		'nvim-treesitter/nvim-treesitter',
		run = ':TSUpdate',
	}
	use 'neovim/nvim-lspconfig'
	use {
		'hrsh7th/cmp-nvim-lsp',
		requires = {
			'hrsh7th/nvim-cmp'
		},
	}
end)
