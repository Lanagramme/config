modkey = "Mod4"

local function pick_first_available(...)
		for _, cmd in ipairs({...}) do
        local f = io.popen("command -v " .. cmd .. " >/dev/null 2>&1 && echo 1 || echo 0")
        local ok = tonumber(f:read("*a"))
        f:close()
        if ok == 1 then
            return cmd
        end
    end
    return nil
end

terminal     = os.getenv("TERMINAL") or pick_first_available("kitty", "alacritty", "gnome-terminal", "sakura", "tilix")
file_manager = os.getenv("FILE_MANAGER") or pick_first_available("pcmanfm", "thunar", "nautilus", "dolphin")
browser      = os.getenv("BROWSER") or pick_first_available("zen-browser", "firefox", "firefox-esr", "chromium")
editor       = os.getenv("EDITOR") or pick_first_available("nvim", "vim", "vi")

editor_cmd   = terminal .. " -e " .. editor
volume_cmd = pick_first_available("wpctl", "amixer")
