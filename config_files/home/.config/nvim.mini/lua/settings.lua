--
-- ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗
-- ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║
-- ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║
-- ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║
-- ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║
-- ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝
--
-- File: autocmds.lua
-- Description: Autocommand functions
-- Author: Christen Di Mercurio
--

vim.g.mapleader = " "

-- indentation
vim.opt.autoindent = true
vim.opt.smarttab = true
vim.opt.smartindent = true
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2

vim.opt.clipboard = "unnamedplus"
vim.opt.encoding = "utf-8"
vim.opt.syntax = "enable"

-- search
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- UI
vim.cmd.colorscheme("retrobox")
vim.opt.cursorline = true
vim.opt.colorcolumn = "80,100"
vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.mouse = "a"

vim.opt.scrolloff = 18     -- minimal number of screen lines to keep above and below the cursor
vim.opt.sidescrolloff = 3  -- minimal number of screen columns to keep to the left and right (horizontal) of the cursor if wrap is `false`

vim.opt.termguicolors = true -- enable 24-bit RGB colors

-- persistent undo
-- Don"t forget to create folder $HOME/.local/share/nvim/undo
local undodir = vim.fn.stdpath("data") .. "/undo"
vim.opt.undofile = true -- enable persistent undo
vim.opt.undodir = undodir
vim.opt.undolevels = 1000
vim.opt.undoreload = 10000


