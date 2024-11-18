vim.wo.number = true
vim.cmd("set relativenumber")

vim.opt.colorcolumn ='80'
vim.cmd("set autoindent")
vim.cmd("%retab!")
vim.cmd("set smarttab")
-- use tab instead of spaces when using >
vim.o.expandtab = true
vim.o.shiftwidth = 2
vim.o.tabstop = 2

vim.cmd("set cursorline")
vim.cmd("set cc=80")

vim.cmd("set noswapfile")

vim.cmd("set scrolloff=8")
vim.cmd("set sidescrolloff=8")

-- Save undo history
vim.o.undofile = true

-- Set completeopt to have a better completion experience
vim.o.completeopt = 'menuone,noselect'

-- NOTE: You should make sure your terminal supports this
vim.o.termguicolors = true


-- jump back to last position when opening a file 
local group = vim.api.nvim_create_augroup("jump_last_position", { clear = true })
vim.api.nvim_create_autocmd(
	"BufReadPost",
	{callback = function()
			local row, col = unpack(vim.api.nvim_buf_get_mark(0, "\""))
			if {row, col} ~= {0, 0} then
				vim.api.nvim_win_set_cursor(0, {row, 0})
			end
		end,
	group = group
	}
)

-- auto-reload files when modified externally
-- https://unix.stackexchange.com/a/383044
vim.o.autoread = true
vim.api.nvim_create_autocmd({ "BufEnter", "CursorHold", "CursorHoldI", "FocusGained" }, {
  command = "if mode() != 'c' | checktime | endif",
  pattern = { "*" },
})

-- Function to execute Python script
function _G.execute_python_script(...)
  local args = table.concat({...}, ' ')

  local script_name, params = args:match("(%S+)%s(.+)")

  if not script_name then
    print("Error: Please provide a script name")
    return
  end

  local script_path = vim.fn.expand('~/.config/nvim/templates/' .. script_name .. '.py')

  if vim.fn.filereadable(script_path) == 0 then
    print("Error: Python script not found")
    return
  end

  local current_buffer_path = vim.fn.expand('%:p')

  local command = string.format("python3 %s %s %s", vim.fn.shellescape(script_path), vim.fn.shellescape(params or ''), vim.fn.shellescape(current_buffer_path))

  local handle = io.popen(command .. ' 2>&1')
  local result = handle:read('*a')
  handle:close()

  print(result)
end

-- Define the Neovim command
vim.cmd([[
  command! -nargs=+ -complete=file -bar Templates :lua execute_python_script(<q-args>)
]])

-- defind tab size for python files
vim.api.nvim_create_augroup('CustomFileTypeSettings', {})
vim.api.nvim_create_autocmd('FileType', {
    group = 'CustomFileTypeSettings',
    pattern = 'python',  -- or '*.py' for matching file extension
    callback = function()
        vim.opt.shiftwidth = 2
        vim.opt.tabstop = 2
    end
})
