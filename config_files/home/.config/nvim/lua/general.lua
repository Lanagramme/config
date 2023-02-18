--  ,----..                                                                 ,--,    
-- /   /   \                                                              ,--.'|    
--|   :     :                   ,---,               __  ,-.               |  | :    
--.   |  ;. /               ,-+-. /  |            ,' ,'/ /|               :  : '    
--.   ; /--`      ,---.    ,--.'|'   |    ,---.   '  | |' |    ,--.--.    |  ' |    
--;   | ;  __    /     \  |   |  ,"' |   /     \  |  |   ,'   /       \   '  | |    
--|   : |.' .'  /    /  | |   | /  | |  /    /  | '  :  /    .--.  .-. |  |  | :    
--.   | '_.' : .    ' / | |   | |  | | .    ' / | |  | '      \__\/: . .  '  : |__  
--'   ; : \  | '   ;   /| |   | |  |/  '   ;   /| ;  : |      ," .--.; |  |  | '.'| 
--'   | '/  .' '   |  / | |   | |--'   '   |  / | |  , ;     /  /  ,.  |  ;  :    ; 
--|   :    /   |   :    | |   |/       |   :    |  ---'     ;  :   .'   \ |  ,   /  
-- \   \ .'     \   \  /  '---'         \   \  /            |  ,     .-./  ---`-'   
--  `---`        `----'                  `----'              `--`---'               

-- See `:help vim.o`

local o = vim.o
local wo = vim.wo


o.encoding = "UTF-8"

-- Make line numbers default
wo.number = true
wo.relativenumber = true

o.autoindent = true
o.tabstop = 2
o.shiftwidth = 2

wo.cursorline = true

-- Enable mouse mode
o.mouse = 'a'

o.scrolloff = 8
o.sidescrolloff = 8

-- Set highlight on search
o.hlsearch = true

-- Enable break indent
o.breakindent = true

-- Save undo history
o.undofile = true

-- Case insensitive searching UNLESS /C or capital in search
o.ignorecase = true
o.smartcase = true

-- Decrease update time
o.updatetime = 250
wo.signcolumn = 'yes'

-- Set colorscheme
vim.o.termguicolors = true
vim.cmd [[colorscheme onedark]]
vim.cmd [[ let g:vimwiki_list = [{'path': '~/vimwiki/',
                      \ 'syntax': 'markdown', 'ext': '.md'}] ]]

-- Set completeopt to have a better completion experience
vim.o.completeopt = 'menuone,noselect'

-- new split panes to the right or bellow
o.splitbelow = true
o.splitright = true

-- Jump to the last position when reopening a file
vim.cmd [[ 
  if has("autocmd")
    au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
      \| exe "normal! g'\"" | endif
  endif
]]
