return {
  -- Autocompletion engine
  {
    'hrsh7th/nvim-cmp',
    dependencies = {
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-path',
      'hrsh7th/cmp-cmdline',
      'L3MON4D3/LuaSnip',
      'saadparwaiz1/cmp_luasnip',
      'rafamadriz/friendly-snippets',
    },
    config = function()
      local cmp = require('cmp')
      local luasnip = require('luasnip')

      require("luasnip.loaders.from_vscode").lazy_load()

      cmp.setup({
        snippet = {
          expand = function(args)
            luasnip.lsp_expand(args.body)
          end,
        },
        mapping = cmp.mapping.preset.insert({
          ['<Tab>'] = cmp.mapping.select_next_item(),
          ['<S-Tab>'] = cmp.mapping.select_prev_item(),
          ['<CR>'] = cmp.mapping.confirm({ select = true }),
          ['<C-Space>'] = cmp.mapping.complete(),
        }),
        sources = cmp.config.sources({
          { name = 'nvim_lsp' },
          { name = 'luasnip' },
        }, {
          { name = 'buffer' },
          { name = 'path' },
        })
      })
    end,
  },
-- LSP Config & Mason
  {
    'williamboman/mason.nvim',
    build = ":MasonUpdate",
    config = true,
  },
  {
    'williamboman/mason-lspconfig.nvim',
    config = function()
      require("mason-lspconfig").setup {
        ensure_installed = {
          -- "tsserver",   -- JavaScript & TypeScript
					"emmet_ls",
          "html",       -- HTML
          "cssls",      -- CSS
          "pyright",    -- Python
        }
      }
    end
  },
  {
    'neovim/nvim-lspconfig',
    config = function()
      local lspconfig = require('lspconfig')
      local capabilities = require('cmp_nvim_lsp').default_capabilities()

			lspconfig.emmet_ls.setup({
				capabilities = capabilities,
				filetypes = {
					"html", "css", "scss", "javascriptreact", "typescriptreact",
					"vue", "xml", "blade", "svelte"
				},
				init_options = {
					html = {
						options = {
							["bem.enabled"] = true,
						}
					}
				}
			})

      -- Setup for each language
      -- lspconfig.tsserver.setup { capabilities = capabilities }
      lspconfig.html.setup { capabilities = capabilities }
      lspconfig.cssls.setup { capabilities = capabilities }
      lspconfig.pyright.setup { capabilities = capabilities }
    end
  }
}

