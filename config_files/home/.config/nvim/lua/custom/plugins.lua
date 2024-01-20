local plugins = {
  {
    "nvim-neorg/neorg",
    lazy = false,
    build = ":Neorg sync-parsers",
    -- tag = "*",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require("neorg").setup {
        load = {
          ["core.defaults"] = {}, -- Loads default behaviour
          ["core.concealer"] = {}, -- Adds pretty icons to your documents
          ["core.dirman"] = { -- Manages Neorg workspaces
            config = {
              workspaces = {
                notes = "~/notes",
              },
            },
          },
        },
      }
    end,
  },
  {
    "christoomey/vim-tmux-navigator",
    lazy = false,
  },
  { 'dundalek/lazy-lsp.nvim', requires = { 'neovim/nvim-lspconfig' } },
  {
    "neovim/nvim-lspconfig",
    config = function ()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end
  },
{
    "nvim-neo-tree/neo-tree.nvim",
    lazy = false,
    branch = "v3.x",
    -- lazy = false,
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons",
      "MunifTanjim/nui.nvim",
			{
        's1n7ax/nvim-window-picker',
        version = '2.*',
        config = function()
            require 'window-picker'.setup({
                filter_rules = {
                    include_current_win = false,
                    autoselect_one = true,
                    bo = {
                        filetype = { 'neo-tree', "neo-tree-popup", "notify" },
                        buftype = { 'terminal', "quickfix" },
                    },
            },
        })
        end,
      },
    },
		config = function()
		
      vim.fn.sign_define("DiagnosticSignError",
        {text = " ", texthl = "DiagnosticSignError"})
      vim.fn.sign_define("DiagnosticSignWarn",
        {text = " ", texthl = "DiagnosticSignWarn"})
      vim.fn.sign_define("DiagnosticSignInfo",
        {text = " ", texthl = "DiagnosticSignInfo"})
      vim.fn.sign_define("DiagnosticSignHint",
        {text = "󰌵", texthl = "DiagnosticSignHint"})

			require("neo-tree").setup({
				
        close_if_last_window = true, -- Close Neo-tree if it is the last window left in the tab
        popup_border_style = "rounded",
        enable_git_status = true,
        enable_diagnostics = true,
        enable_normal_mode_for_inputs = false, -- Enable normal mode for input dialogs.
        open_files_do_not_replace_types = { "terminal", "trouble", "qf" }, -- when opening files, do not use windows containing these filetypes or buftypes
        sort_case_insensitive = false,
				
			})


			vim.keymap.set("n", "<C-n>", ":Neotree filesystem toggle left<CR>", {})
			vim.keymap.set("n", "<C-t>", ":Neotree focus<CR>", {})
		end
	},
{
      "vimwiki/vimwiki",
      event = "BufEnter *.md",
      keys = {"<leader>ww"},
      init = function()
        vim.g.vimwiki_list = {
          {
            path = "~/vimwiki",
            syntax = "markdown",
            ext = ".md"
          },
           }
        vim.g.vimwiki_ext2syntax = {
          [".md"] = "markdown",
          [".markdown"] = "markdown",
          [".mdown"] = "markdown",
        }
      end
    },
{
    "max397574/better-escape.nvim",
    lazy = false,
    config = function()
      require("better_escape").setup({
      mapping = {"jj", "kj"}, -- a table with mappings to use
      timeout = vim.o.timeoutlen, -- the time in which the keys must be hit in ms. Use option timeoutlen by default
      clear_empty_lines = false, -- clear line after escaping if there is only whitespace
      keys = "<Esc>", -- keys used for escaping, if it is a function will use the result everytime
      -- example(recommended)
      -- keys k= function()
      --   return vim.api.nvim_win_get_cursor(0)[2] > 1 and '<esc>l' or '<esc>'
      -- end,
  })
    end,
  },
{
		'renerocksai/telekasten.nvim',
		dependencies = {
			"renerocksai/calendar-vim",
			'mzlogin/vim-markdown-toc'
		},
		vaults = {
			"notes",
			"default",
			"Todo"
		},
		setup = function()
	end
	},
	{
		"nvim-telescope/telescope-media-files.nvim",
		dependencies = {
		 'nvim-lua/popup.nvim',
		 'nvim-lua/plenary.nvim',
		},
		setup = function()
			require('telescope').load_extension('media_files')
		end
	},
	{
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    ft = { "markdown" },
    build = function() vim.fn["mkdp#util#install"]() end,
	},
}

return plugins
