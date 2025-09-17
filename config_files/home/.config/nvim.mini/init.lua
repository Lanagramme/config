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

-- Check NeoVim version
if vim.fn.has('nvim-0.8') == 0 then
    error('Need Neovim 0.8+ in order to use this config')
end

-- Check requirements
for _, cmd in ipairs({ "git", "rg", { "fd", "fdfind" }, "curl" }) do
  local name = type(cmd) == "string" and cmd or vim.inspect(cmd)
  local commands = type(cmd) == "string" and { cmd } or cmd
  ---@cast commands string[]
  local found = false

  for _, c in ipairs(commands) do
    if vim.fn.executable(c) == 1 then
      name = c
      found = true
    end
  end

  if not found then
    error(("`%s` is not installed"):format(name))
  end
end

-- Disable annoying deprecated message
vim.deprecate = function() end


-- Load local config
for _, source in ipairs({
  "config.lazy",
  "mappings",
  "settings",
}) do
  -- detect files with error and do not load them while printing the error
  local ok, fault = pcall(require, source)
  if not ok then
    vim.api.nvim_err_writeln("Failed to load " .. source .. "\n\n" .. fault)
  end
end

-- load mini plugins
local minis = {}
for _, mini in ipairs({
  "pairs",
  "surround",
  "animate",
  "cursorword",
  "files",
  "indentscope",
  "icons",
  "tabline",
  "starter",
  -- "map",
  "statusline",
}) do
	require("mini." .. mini).setup()
end

-- lua = MiniMap.open()
