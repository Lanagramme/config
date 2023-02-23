-- _   __               _      _             _  _                    
--| | / /              | |    (_)           | |(_)                   
--| |/ /   ___  _   _  | |__   _  _ __    __| | _  _ __    __ _  ___ 
--|    \  / _ \| | | | | '_ \ | || '_ \  / _` || || '_ \  / _` |/ __|
--| |\  \|  __/| |_| | | |_) || || | | || (_| || || | | || (_| |\__ \
--\_| \_/ \___| \__, | |_.__/ |_||_| |_| \__,_||_||_| |_| \__, ||___/
--               __/ |                                     __/ |     
--              |___/                                     |___/      

local g = vim.g
local keymap = vim.keymap

-- [[ Basic Keymaps ]]
-- Set <space> as the leader key
-- See `:help mapleader`
--  NOTE: Must happen before plugins are required (otherwise wrong leader will be used)
g.mapleader = ' '
g.maplocalleader = ' '

-- Keymaps for better default experience
-- See `:help vim.keymap.set()`
keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- Remap for dealing with word wrap
keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- move line or visually selected block up or down with alt+j/k
keymap.set('i', '<A-j>', '<ESC>:m .+1<CR>==gi')
keymap.set('i', '<A-k>', '<ESC>:m .-2<CR>==gi')
keymap.set('n', '<A-j>', ":m '>+1<CR>gv==gv")
keymap.set('n', '<A-k>', ":m '<-2<CR>gv==gv")

-- move split panes
keymap.set('n', '<A-h>', "<C-W>H")
keymap.set('n', '<A-j>', "<C-W>J")
keymap.set('n', '<A-k>', "<C-W>K")
keymap.set('n', '<A-l>', "<C-W>L")

-- navigate between panes
keymap.set('n', '<C-h>', "<C-w>h")
keymap.set('n', '<C-j>', "<C-w>j")
keymap.set('n', '<C-k>', "<C-w>k")
keymap.set('n', '<C-l>', "<C-w>l")

keymap.set('i', 'kj', "<ESC>")

keymap.set("n", "<leader>pv", vim.cmd.Ex)
