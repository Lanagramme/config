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
-- beautiful.init(gears.filesystem.get_themes_dir() .. "default/theme.lua")
local theme = require("theme")
beautiful.init(theme)

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

local dpi = beautiful.xresources.apply_dpi


beautiful.tasklist_bg_normal =  "#0d0f18"
beautiful.tasklist_bg_focus =  "#828fa5"


local function get_tray(s)
  local tray = wibox.widget.systray()
  tray:set_screen(s)
  tray:set_horizontal(false)
  tray:set_base_size(20)
  beautiful.systray_icon_spacing = 10
  return tray
end

local function get_layout(s)
  local layoutbox = awful.widget.layoutbox(s)
  layoutbox.forced_height = 20
  layoutbox.forced_width = 20
  return layoutbox
end

local hour = wibox.widget {
    align = 'center',
    widget = wibox.widget.textclock('<span font="Roboto 15" color="#828fa5">%H</span>')
}

local minutes = wibox.widget {
    align = 'center',
    widget = wibox.widget.textclock('<span font="Roboto 15" color="#828fa5">%M</span>')
}

local function mkroundedrect(radius)
    radius = radius or dpi(7)
    return function (cr, w, h)
        return gears.shape.rounded_rect(cr, w, h, radius)
    end
end

local taglist_buttons = gears.table.join(
                    awful.button({ }, 1, function(t) t:view_only() end),
                    awful.button({ modkey }, 1, function(t)
                                              if client.focus then
                                                  client.focus:move_to_tag(t)
                                              end
                                          end),
                    awful.button({ }, 3, awful.tag.viewtoggle),
                    awful.button({ modkey }, 3, function(t)
                                              if client.focus then
                                                  client.focus:toggle_tag(t)
                                              end
                                          end),
                    awful.button({ }, 4, function(t) awful.tag.viewnext(t.screen) end),
                    awful.button({ }, 5, function(t) awful.tag.viewprev(t.screen) end)
                )

-- Créer une fonction pour mettre à jour la taglist
local function update_taglist(s)
  return awful.widget.taglist {
    screen  = s,
    filter  = awful.widget.taglist.filter.all,
    buttons = taglist_buttons,
    style   = {
      font = "FontAwesome 10",  -- Adjust the font and size as needed
      shape = function(cr, width, height)
        gears.shape.partially_rounded_rect(cr, width, height, false, true, false, true, 6)
      end,
    },
    layout   = {
        layout  = wibox.layout.fixed.vertical,
    },
    widget_template = {
      {
        {
          {
            id     = 'text_role',
            widget = wibox.widget.textbox,
          },
          layout = wibox.layout.align.horizontal,
        },
        widget = wibox.container.background,
      },
      widget  = wibox.container.margin,
      create_callback = function(self, c3, index, objects)
        self:get_children_by_id('text_role')[1].markup = '<b>' .. c3.name .. '</b>'
        -- Ajouter l'action de clic pour changer vers le tag correspondant
        self:buttons(awful.button({}, 1, function()
          c3:view_only()
        end))
      end,
      update_callback = function(self, c3, index, objects)
        self:get_children_by_id('text_role')[1].markup = '<b>' .. c3.name .. '</b>'
      end,
    },
  }
end
local tasklist_buttons = gears.table.join(
  awful.button({ }, 1, function (c)
    if c == client.focus then
      c.minimized = true
    else
      c:emit_signal( "request::activate", "tasklist", {raise = true})
    end
  end),
  awful.button({ }, 3, function() awful.menu.client_list({ theme = { width = 250 } }) end),
  awful.button({ }, 4, function() awful.client.focus.byidx(1) end),
  awful.button({ }, 5, function() awful.client.focus.byidx(-1) end)
)

local rubato = require 'rubato'

local function gettaglist(s)
    return awful.widget.taglist {
        screen = s,
        filter = awful.widget.taglist.filter.all,
        style = {
            shape = gears.shape.rounded_bar,
        },
        layout = {
            spacing = 10,
            layout = wibox.layout.fixed.vertical,
        },
        buttons = taglist_buttons,
        widget_template = {
            {
                markup = '',
                widget = wibox.widget.textbox,
            },
            id = 'background_role',
            forced_height = 17,
            forced_width = 7,
            widget = wibox.container.background,
            create_callback = function (self, tag)
                self.animate = rubato.timed {
                    duration = 0.15,
                    subscribed = function (h)
                        self:get_children_by_id('background_role')[1].forced_height = h
                    end
                }

                self.update = function ()
                    if tag.selected then
                        self.animate.target = 18
                    elseif #tag:clients() > 0 then
                        self.animate.target = 14
                    else
                        self.animate.target = 8
                    end
                end

                self.update()
            end,
            update_callback = function (self)
                self.update()
            end,
        }
    }
end

beautiful.taglist_bg_occupied = "#ffffff89"
beautiful.taglist_bg_empty = "#1a1c25"
-- backddd

-- Ajouter la taglist à la barre avec une marge de 15 pixels
awful.screen.connect_for_each_screen(function(s)
  local separator = wibox.widget {
    widget = wibox.widget.separator,
    orientation = "vertical",
    forced_width = 5,  -- Adjust the width of the separator as needed
    forced_height = 5,
    color = "#66666600",  -- Adjust the color of the separator as needed
}

  local tasks = awful.widget.tasklist {
    screen   = s,
    filter   = awful.widget.tasklist.filter.currenttags,
    buttons  = tasklist_buttons,  -- You can customize the button actions if needed
    layout   = {
      layout = wibox.layout.fixed.vertical,  -- Use vertical layout
    },
    widget_template = {
    {
      {
        {
          {
            {
              {
                id     = 'icon_role',
                widget = wibox.widget.imagebox,
              },
              margins = 2,
              widget  = wibox.container.margin,
            },
            {
                id     = 'text_role',
                widget = wibox.widget.textbox,
            },
            layout = wibox.layout.fixed.horizontal,
          },
          left  = 5,
          right = 5,
          widget = wibox.container.margin
        },
        id     = 'background_role',
        shape = mkroundedrect(),
        bg = "#26283133",
        widget = wibox.container.background,
      },
      left  = 5,
      right = 5,
      widget = wibox.container.margin
      },
      separator,
      layout = wibox.layout.fixed.vertical
    },
    width = 5,
  }

  beautiful.tasklist_bg_focus = "#86aaec"
  beautiful.tasklist_bg_minimize = "#26283133"
  beautiful.tasklist_spacing = 10
  beautiful.tasklist_shape_focus = mkroundedrect()
  beautiful.tasklist_shape_minimized = mkroundedrect()

  local clock = wibox.widget
  {
    {
      {
        {
          hour,
          minutes,
          spacing = 1,
          layout = wibox.layout.fixed.vertical,
        },
        top = 5,
        bottom = 5,
        left = 1,
        right = 1,
        widget = wibox.container.margin
      },
      shape = mkroundedrect(),
      bg = "#26283133",
      widget = wibox.container.background,
    },
    left = 5,
    right = 5,
    bottom = 20,
    widget = wibox.container.margin
  }
  local tray = wibox.widget{
    {
      {
        get_tray(s),
        left = 6,
        widget = wibox.container.margin,
      },
      bottom = 30,
      widget = wibox.container.margin
    },
    halign = "center",
    valign = "center",
    layout = wibox.container.place
  }

  local tags = wibox.widget{
    {
      gettaglist(s),
      -- update_tagrist(s)
      top = 20,
      widget = wibox.container.margin,
    },
    halign = "center",
    valign = "center",
    layout = wibox.container.place
  }

  local layouts = wibox.widget{
    {
      get_layout(s),
      bottom = 20,
      widget = wibox.container.margin,
    },
    halign = "center",
    valign = "center",
    layout = wibox.container.place
  }

  -- Créer la Wibar
  local mywibox = awful.wibar({
    position = "left",
    screen = s,
    width = 50,
    border_width = 10,
    bg = "#0d0f18",
    shape = mkroundedrect(),
  })
  beautiful.bg_systray = "#0d0f18"

  -- Ajouter d'autres widgets à la barre
  mywibox:setup {
    {
      {
        layout = wibox.layout.fixed.vertical,
        tags,
      },
      nil,
      {
        layout = wibox.layout.fixed.vertical,
        tray,
        clock,
        layouts,
      },
      layout = wibox.layout.align.vertical,
    },
    {
      tasks,
      halign = "center",
      valign = "center",
      layout = wibox.container.place
    },
    layout = wibox.layout.stack
  }

  -- Ajouter une marge de 15 pixels autour de la Wibar
  mytaglist = wibox.container.margin(mytaglist, 15, 15, 15, 15)
end)
