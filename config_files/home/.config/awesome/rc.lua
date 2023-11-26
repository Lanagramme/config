-- If LuaRocks is installed, make sure that packages installed through it are
-- found (e.g. lgi). If LuaRocks is not installed, do nothing.
pcall(require, "luarocks.loader")
-- Standard awesome library
local gears = require("gears")
local awful = require("awful")
require("awful.autofocus")
-- Widget and layout library
local wibox = require("wibox")
-- Theme handling library
local beautiful = require("beautiful")
-- Notification library
local naughty = require("naughty")
local menubar = require("menubar")
local hotkeys_popup = require("awful.hotkeys_popup")
-- Enable hotkeys help widget for VIM and other apps
-- when client with a matching name is opened:
require("awful.hotkeys_popup.keys")

require("errors")(naughty)

-- {{{ Variable definitions
-- Themes define colours, icons, font and wallpapers.
beautiful.init(gears.filesystem.get_themes_dir() .. "default/theme.lua")

-- This is used later as the default terminal and editor to run.
-- terminal = "gnome-terminal"
-- terminal = "sakura"
terminal = "tilix"
editor = os.getenv("EDITOR") or "nvim"
editor_cmd = terminal .. " -e " .. editor
modkey = "Mod4"

require ("controls")(gears, awful, hotkeys_popup, menubar)
require ("tabs")(awful, gears, screen, client)
require ("rules")(awful, beautiful)
require ("titlebar")(client, awful, wibox)
require ("screen")(awful, beautiful, gears, hotkeys_popup, wibox, menubar)

-- Set keys
root.keys(globalkeys)
-- }}}

require ("signals")(client, awesome, awful)

-- Enable sloppy focus, so that focus follows mouse.
client.connect_signal("mouse::enter", function(c)
    c:emit_signal("request::activate", "mouse_enter", {raise = false})
end)

client.connect_signal("focus", function(c) c.border_color = beautiful.border_focus end)
client.connect_signal("unfocus", function(c) c.border_color = beautiful.border_normal end)
-- }}}

-- {{{ Gaps
beautiful.useless_gap = 5
-- }}}

require ("autostart")(awful)
