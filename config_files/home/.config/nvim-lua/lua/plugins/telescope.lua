return {
	'nvim-telescope/telescope.nvim', 
	tag = '0.1.5',
	dependencies = { 'nvim-lua/plenary.nvim' },
	config = function()
		local builtin = require("telescope.builtin")
		vim.keymap.set('n', "<leader>ff", builtin.find_files, {})
		vim.keymap.set('n', "<leader>fw", builtin.live_grep, {})
		require('telescope').setup({
			extensions = {
				media_files = {
					-- filetypes whitelist
					-- defaults to {"png", "jpg", "mp4", "webm", "pdf"}
					filetypes = {"png", "webp", "jpg", "jpeg"},
					-- find command (defaults to `fd`)
					find_cmd = "rg"
				}
			},
		})
	end
	}
