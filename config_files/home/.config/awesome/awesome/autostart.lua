local function autostart(awful)
	-- {{{ Autostart
	-- awful.spawn.with_shell("feh --bg-fill -r -z ~/Images/Wallpapers/Landscape/")
	awful.spawn.with_shell("feh --bg-scale -r -z ~/Images/Wallpapers/Landscape/")
	awful.spawn.with_shell("compton")
	awful.spawn.with_shell("nm-applet")
	awful.spawn.with_shell("killall -q polybar && polybar || polybar")
	-- }}}
end

return autostart
