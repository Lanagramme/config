local plugins = {
  {'Yggdroot/indentLine', lazy = false},
 -- {
 --    'lukas-reineke/indent-blankline.nvim',
 --    config = function()
 --      require("indent_blankline").setup {
 --        char = '▏',  -- or '|'
 --        use_treesitter = true,  -- Enable Treesitter integration
 --        show_trailing_blankline_indent = false,
 --        show_first_indent_level = true,
 --        filetype_exclude = { 'help', 'packer', 'NvimTree', 'dashboard' },  -- Exclude non-code file types
 --        buftype_exclude = { 'terminal', 'nofile' },  -- Exclude non-file buffers
 --        show_current_context = true,
 --        show_current_context_start = true,
 --        space_char_blankline = ' ',
 --        context_patterns = {
 --          'class', 'function', 'method', 'block', 'list_literal',
 --          'selector', '^if', '^table', 'if_statement', 'while',
 --          'for'
 --        },
 --      }
 --    end,
 --  },
  {"dundalek/lazy-lsp.nvim"},
  {
    'nvimdev/lspsaga.nvim',
    config = function()
      require('lspsaga').setup({})
    end,
    dependencies = {
      'nvim-treesitter/nvim-treesitter',
      'nvim-tree/nvim-web-devicons'
    }
  },
  {
    "tpope/vim-surround",
    lazy = false,
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


      vim.keymap.set("n", "<C-t>", ":Neotree filesystem toggle left<CR>", {})
      vim.keymap.set("n", "<C-e>", ":Neotree focus<CR>", {})
    end
  },
  -- {
  --   "vimwiki/vimwiki",
  --   lazy = false,
  --   event = "BufEnter *.md",
  --   keys = {"<leader>ww"},
  --   init = function()
  --     vim.g.vimwiki_list = {
  --       {
  --         path = "~/vimwiki",
  --         syntax = "markdown",
  --         ext = ".md"
  --       },
  --     }
  --     vim.g.vimwiki_ext2syntax = {
  --       [".md"] = "markdown",
  --       [".markdown"] = "markdown",
  --       [".mdown"] = "markdown",
  --     }
  --   end
  -- },
  {
    'MeanderingProgrammer/render-markdown.nvim',
    lazy=false,
    -- dependencies = { 'nvim-treesitter/nvim-treesitter', 'echasnovski/mini.nvim' }, -- if you use the mini.nvim suite
    -- dependencies = { 'nvim-treesitter/nvim-treesitter', 'echasnovski/mini.icons' }, -- if you use standalone mini plugins
    dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' }, -- if you prefer nvim-web-devicons
    ---@module 'render-markdown'
    ---@type render.md.UserConfig
    opts = {},
  },
  {
    "iamcco/markdown-preview.nvim",
    lazy = false,
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    build = "cd app && yarn install",
    init = function()
      vim.g.mkdp_filetypes = { "markdown" }
    end,
    ft = { "markdown" },
  },
  {
  "epwalsh/obsidian.nvim",
  version = "*",  -- recommended, use latest release instead of latest commit
  lazy = false,
  ft = "markdown",
  -- Replace the above line with this if you only want to load obsidian.nvim for markdown files in your vault:
  -- event = {
  --   -- If you want to use the home shortcut '~' here you need to call 'vim.fn.expand'.
  --   -- E.g. "BufReadPre " .. vim.fn.expand "~" .. "/my-vault/*.md"
  --   -- refer to `:h file-pattern` for more examples
  --   "BufReadPre path/to/my-vault/*.md",
  --   "BufNewFile path/to/my-vault/*.md",
  -- },
  dependencies = {
    -- Required.
    "nvim-lua/plenary.nvim",

    -- see below for full list of optional dependencies 👇
  },
  opts = {
    workspaces = {
      {
        name = "vimwiki",
        path = "~/vimwiki",
      },
      {
        name = "vault",
        path = "~/storage/shared/Documents/Obsidian/arcane/",
      },
    },

    -- see below for full list of options 👇
  },
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
