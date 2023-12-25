pcall(require, "luarocks.loader")

local gears       = require("gears")
local awful       = require("awful")
local wibox       = require("wibox")
local beautiful   = require("beautiful")
local naughty     = require("naughty")
local menubar     = require("menubar")
local freedesktop = require("freedesktop")

require("awful.autofocus")

require("autostart")
require("controls")
-- require("titlebar")
require("signals")
require("errors")
require("rules")
require("wibar")
require("user")
require("tabs")
require("layout")
require("menu")


root.keys(globalkeys)
