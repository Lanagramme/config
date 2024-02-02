-- browser = "firefox-esr"
browser = "firefox"

-- file_manager = "thunar"
-- file_manager = "pcmanfm"
file_manager = "nautilus"

-- terminal = "gnome-terminal"
-- terminal = "sakura"
-- terminal = "tilix"
-- terminal = "kitty"
terminal = "alacritty"

editor = os.getenv("EDITOR") or "nvim"
editor_cmd = terminal .. " -e " .. editor

modkey = "Mod4"
