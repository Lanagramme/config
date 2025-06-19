return (
	{
		"rcarriga/nvim-notify",
		config = function()
			vim.notify = require("notify")

			-- Optional config
			require("notify").setup({
				stages = "fade_in_slide_out",
				timeout = 3000,
				background_colour = "#1e222a",
				render = "default",
			})
		end,
	}
)
