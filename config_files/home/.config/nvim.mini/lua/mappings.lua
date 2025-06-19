--
-- ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗
-- ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║
-- ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║
-- ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║
-- ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║
-- ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝
--
-- File: mappings.lua
-- Description: Key mapping configs
-- Author: Christen Di Mercurio
--

local map = vim.keymap.set
map("i", 'kj', "<Esc>", { desc = "Quit insert mode"})

map("n", "L", "$", { desc = "Goto end of line" })
map("n", "H", "^", { desc = "Goto start of line" })

-- save buffer to file
map("n", "<C-s>", ":w<CR>", { desc = "Save in normal mode" })
map("i", "<C-s>", "<Esc>:w<CR>a", { desc = "Save in insert mode" })
map("v", "<C-s>", ":w<CR>", { desc = "Save in visual mode" })

-- close buffer
map("n", "<C-w>", ":w<CR>:bdelete<CR>", { desc = "Close buffer in normal mode" })

-- buffer navigation
map("n", "<Tab>", ":bn<CR>", {desc = "Goto next buffer"})
map("n", "<S-Tab>", ":bp<CR>", {desc = "Goto previous buffer"})

-- pane navigation
map("n", "<C-l>", "<C-w>l", { desc = "switch window left" })
map("n", "<C-h>", "<C-w>h", { desc = "switch window right" })
map("n", "<C-j>", "<C-w>j", { desc = "switch window down" })
map("n", "<C-k>", "<C-w>k", { desc = "switch window up" })

map("n", "<Esc>", ":nohlsearch<CR>", {})


-- mini files
map("n", "<C-n>", ":lua MiniFiles.open()<CR>", { desc = "open mini files"})

-- telescope
local builtin = require('telescope.builtin')

map('n', '<leader>ff', builtin.find_files, {desc = "Telescope find file"})
map('n', '<leader>fg', builtin.live_grep, {desc = "Telescope livegrep"})
map('n', '<leader>fb', builtin.buffers, {desc = "Telescope find buffers"})
map('n', '<leader>fh', builtin.help_tags, {desc = "Telescope find help tag"})
