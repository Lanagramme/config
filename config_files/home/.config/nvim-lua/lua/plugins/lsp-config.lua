return {
	{
		"williamboman/mason.nvim",
		config = function()
			require('mason').setup()
		end
	},
	{
		'williamboman/mason-lspconfig.nvim',
		config = function()
			require('mason-lspconfig').setup({
				ensure_installed = {"lua_ls", "tsserver"},
				automatic_installation = true,
			})
		end
	},
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			"j-hui/fidget.nvim",
			"folke/neodev.nvim",
		},
		config = function()
			local lspconfig = require('lspconfig')
			lspconfig.tsserver.setup {}
			lspconfig.lua_ls.setup {}
		end
	},
	{ -- Autocompletion
    'hrsh7th/nvim-cmp',
    dependencies = {
			'hrsh7th/cmp-nvim-lsp',
			'L3MON4D3/LuaSnip',
			'saadparwaiz1/cmp_luasnip'
		},
	}
}
