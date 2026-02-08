local awful = require("awful")
-- awful.spawn.with_shell("~/.config/awesome/polybar/launch.sh")
-- awful.spawn.with_shell("feh --bg-scale -r -z ~/Images/Wallpapers/Landscape/")

awful.spawn.once("picom")
awful.spawn.once("blueberry-tray")
awful.spawn.once("caffeine")
awful.spawn.once("nm-applet")
awful.spawn.once("cbatticon")

-- awful.spawn("picom")
-- awful.spawn("blueberry-tray")
-- awful.spawn("caffeine")
-- awful.spawn("nm-applet")
-- awful.spawn("cbatticon")

awful.spawn("python3 " .. os.getenv("HOME") .. "/script/random_wallpaper.py")
awful.spawn.with_shell("solaar --window=hide &")

-- awful.spawn.with_shell("xset s 300 300 && xautolock -time 15 -locker 'systemctl suspend' -detectsleep")
awful.spawn.once("xset s 300 300 && xautolock -time 15 -locker 'systemctl suspend' -detectsleep")

awful.spawn("setxkbmap fr,us -option grp:alt_shift_toggle")

