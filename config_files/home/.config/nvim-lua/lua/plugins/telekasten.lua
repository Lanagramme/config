return {
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
	}
}

-- Prerequisites
--
--     Chafa (required for image support)
--     ImageMagick (optional, for svg previews)
--     fd / rg / find or fdfind in Ubuntu/Debian.
--     ffmpegthumbnailer (optional, for video preview support)
--     pdftoppm (optional, for pdf preview support. Available in the AUR as poppler package.)
--     epub-thumbnailer (optional, for epub preview support.)
--     fontpreview (optional, for font preview support)
--
