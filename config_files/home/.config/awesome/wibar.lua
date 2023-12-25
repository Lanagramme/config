local wibox     = require("wibox")
local beautiful = require("beautiful")
local awful     = require("awful")
local gears     = require("gears")
local modkey    = "Mod4"
local theme     = require("theme")
local rubato = require 'rubato'

local gray = "#1a1c25"

local dpi = beautiful.xresources.apply_dpi

local function mkroundedrect(radius)
    radius = radius or dpi(7)
    return function (cr, w, h)
        return gears.shape.rounded_rect(cr, w, h, radius)
    end
end

local function system_tray(s)
  local tray = wibox.widget.systray()
  tray:set_screen(s)
  tray:set_horizontal(false)
  tray:set_base_size(20)
  return wibox.widget {
    {
      {
        tray,
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
end

local function layout(s)
  local layoutbox = awful.widget.layoutbox(s)
  layoutbox.forced_height = 20
  layoutbox.forced_width = 20

  return wibox.widget {
    {
      layoutbox,
      bottom = 20,
      widget = wibox.container.margin,
    },
    halign = "center",
    valign = "center",
    layout = wibox.container.place
  }

end

local hour = wibox.widget {
    align = 'center',
    widget = wibox.widget.textclock('<span font="Roboto 15" color="#828fa5">%H</span>')
}

local minutes = wibox.widget {
    align = 'center',
    widget = wibox.widget.textclock('<span font="Roboto 15" color="#828fa5">%M</span>')
}

local clock = wibox.widget {
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
    bg = theme.bg_minimize,
    widget = wibox.container.background,
  },
  left = 5,
  right = 5,
  bottom = 20,
  widget = wibox.container.margin
}

local taglist_buttons = gears.table.join(
  awful.button({ }, 1, function(t) t:view_only() end),
  awful.button({ modkey }, 1, function(t) if client.focus then client.focus:move_to_tag(t) end end),
  awful.button({ }, 3, awful.tag.viewtoggle),
  awful.button({ modkey }, 3, function(t) if client.focus then client.focus:toggle_tag(t) end end),
  awful.button({ }, 4, function(t) awful.tag.viewnext(t.screen) end),
  awful.button({ }, 5, function(t) awful.tag.viewprev(t.screen) end)
)

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


local function tags(s)
    local tags = awful.widget.taglist {
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

    return wibox.widget {
      {
        tags,
        top = 20,
        widget = wibox.container.margin,
      },
      halign = "center",
      valign = "center",
      layout = wibox.container.place
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

awful.screen.connect_for_each_screen(function(s)


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
          bottom = 5,
          top = 5,
          widget = wibox.container.margin
        },
        id     = 'background_role',
        shape = mkroundedrect(),
        bg = theme.bg_minimize,
        widget = wibox.container.background,
      },
      left  = 8,
      right = 8,
      widget = wibox.container.margin
      },
      {
        widget = wibox.widget.separator,
        orientation = "vertical",
        forced_width = 5,
        forced_height = 5,
        color = theme.transparent,
      },
      layout = wibox.layout.fixed.vertical
    },
    width = 5,
  }

  local mywibox = awful.wibar({
    position = "left",
    screen = s,
    width = 50,
    border_width = 10,
    bg = theme.transparent
  })

  mywibox:setup {
    {
      {
        {
          layout = wibox.layout.fixed.vertical,
          tags(s),
        },
        nil,
        {
          layout = wibox.layout.fixed.vertical,
          system_tray(s),
          clock,
          layout(s),
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
    },
    bg = "#0d0f18",
    shape = mkroundedrect(),
    widget = wibox.container.background,
  }

end)

beautiful.systray_icon_spacing = 10
beautiful.useless_gap = 5

beautiful.taglist_bg_occupied = theme.fg_normal
beautiful.taglist_bg_empty = gray

beautiful.tasklist_bg_normal = theme.bg_systray
beautiful.tasklist_bg_focus = theme.bg_focus
beautiful.tasklist_bg_minimize = theme.bg_minimize

beautiful.tasklist_spacing = 10
beautiful.tasklist_shape_focus = mkroundedrect()
beautiful.tasklist_shape_minimized = mkroundedrect()

beautiful.bg_systray = theme.bg_systray
