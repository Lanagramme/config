local function autostart(awful)
	-- {{{ Autostart
	-- awful.spawn.with_shell("feh --bg-scale -r -z ~/Images/Wallpapers/Landscape/")
	-- awful.spawn.with_shell("compton")
	-- awful.spawn.with_shell("picom --config ~/.config/picom.conf")
	awful.spawn.with_shell("python3 ~/.config/awesome/terminal.py")
	awful.spawn.with_shell("nm-applet")
	awful.spawn.with_shell("killall -q polybar && polybar || polybar")
	awful.spawn.with_shell("~/.config/polybar/launch.sh")
	-- }}}
end

return autostart
