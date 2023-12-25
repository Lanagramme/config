local awful = require("awful")  
local user = require("user")
local freedesktop = require("freedesktop")
local beautiful = require("beautiful")

require("awful.hotkeys_popup.keys")

local myawesomemenu = {
   { "Hotkeys", function() hotkeys_popup.show_help(nil, awful.screen.focused()) end },
   { "Manual", string.format("%s -e man awesome", terminal) },
   { "Edit config", string.format("%s -e %s %s", terminal, editor, awesome.conffile) },
   { "Restart", awesome.restart },
   { "Quit", function() awesome.quit() end },
}

awful.util.mymainmenu = freedesktop.menu.build {
  before = { { "awesome", myawesomemenu, beautiful.awesome_icon }, },
  after = { { "Open terminal", terminal }, }
}

-- Hide the menu when the mouse leaves it
awful.util.mymainmenu.wibox:connect_signal("mouse::leave", function()
    if not awful.util.mymainmenu.active_child or
      (awful.util.mymainmenu.wibox ~= mouse.current_wibox and
      awful.util.mymainmenu.active_child.wibox ~= mouse.current_wibox) then
        awful.util.mymainmenu:hide()
    else
      awful.util.mymainmenu.active_child.wibox:connect_signal("mouse::leave",
        function()
          if awful.util.mymainmenu.wibox ~= mouse.current_wibox then
            awful.util.mymainmenu:hide()
          end
        end)
    end
end)
