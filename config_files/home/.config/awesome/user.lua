local function command_exists(command)
    local handle = io.popen("command -v " .. command .. " >/dev/null 2>&1 && echo 1 || echo 0")
    local result = handle:read("*a")
    handle:close()
    return tonumber(result) == 1
end

-- browser = "firefox-esr"
browser = "firefox"

-- file_manager = "thunar"
-- file_manager = "pcmanfm"
file_manager = "nautilus"

-- terminal = "gnome-terminal"
-- terminal = "sakura"
-- terminal = "tilix"
-- terminal = "kitty"
-- terminal = "alacritty"


modkey = "Mod4"

-- Set the terminal based on availability
if command_exists("kitty") then
    terminal = "kitty"
elseif command_exists("alacritty") then
    terminal = "alacritty"
else
    -- Fallback to another terminal if neither is available
    terminal = "gnome-terminal"
end

editor = os.getenv("EDITOR") or "nvim"
editor_cmd = terminal .. " -e " .. editor
