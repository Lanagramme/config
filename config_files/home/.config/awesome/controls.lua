local gears = require("gears")
local awful = require("awful")
local menubar = require("menubar")
local hotkeys_popup = require("awful.hotkeys_popup")
require('user')

-- {{{ Mouse bindings
root.buttons(gears.table.join(
  awful.button({ }, 3, function () awful.util.mymainmenu:toggle() end),
  awful.button({ }, 4, awful.tag.viewnext),
  awful.button({ }, 5, awful.tag.viewprev)
))
-- }}}

-- {{{ Key bindings
globalkeys = gears.table.join(

  awful.key({},  "XF86AudioRaiseVolume", function ()
    awful.spawn.easy_async("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+",
      function(stdout, stderr, reason, exit_code) end)
  end, {description = "increase volume", group = "media"}),

  awful.key({},  "XF86AudioLowerVolume", function ()
    awful.spawn.easy_async("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-",
      function(stdout, stderr, reason, exit_code) end)
  end, {description = "increase volume", group = "media"}),

  awful.key({ modkey,           }, "s",      hotkeys_popup.show_help,
    {description="show help", group="awesome"}),
  awful.key({ modkey,           }, "Left",   awful.tag.viewprev,
    {description = "view previous", group = "tag"}),
  awful.key({ modkey,           }, "Right",  awful.tag.viewnext,
    {description = "view next", group = "tag"}),
  awful.key({ modkey,           }, "Escape", awful.tag.history.restore,
    {description = "go back", group = "tag"}),
  awful.key({ modkey,           }, "j", function () awful.client.focus.byidx( 1)    end,
    {description = "focus next by index", group = "client"}),
  awful.key({ modkey,           }, "k", function () awful.client.focus.byidx(-1)    end,
    {description = "focus previous by index", group = "client"}),

  -- Layout manipulation
  awful.key({ modkey, "Shift"   }, "j", function () awful.client.swap.byidx(  1)    end,
    {description = "swap with next client by index", group = "client"}),
  awful.key({ modkey, "Shift"   }, "k", function () awful.client.swap.byidx( -1)    end,
    {description = "swap with previous client by index", group = "client"}),
  awful.key({ modkey, "Control" }, "j", function () awful.screen.focus_relative( 1) end,
    {description = "focus the next screen", group = "screen"}),
  awful.key({ modkey, "Control" }, "k", function () awful.screen.focus_relative(-1) end,
    {description = "focus the previous screen", group = "screen"}),
  awful.key({ modkey,           }, "u", awful.client.urgent.jumpto,
    {description = "jump to urgent client", group = "client"}),

    -- Standard program
    awful.key({ modkey ,          }, "b", function () 
      awful.util.spawn("firefox") end,
              {description = "Launch firefox", group = "applications"}),

    awful.key({ modkey,					  }, "w", function ()
              os.execute(string.format("python3 ~/.config/awesome/random_wallpaper.py"))    end,
              {description = "switch wallpaper", group = "launcher"}),

    awful.key({ modkey,					  }, "d", function ()
              os.execute(string.format("rofi -show run -theme ~/.config/rofi/spotlight.rasi"))		        end,
              {description = "show rofi launcher", group = "launcher"}),

    awful.key({ modkey,					  }, "Tab", function ()
              os.execute(string.format("rofi -show window -theme ~/.config/rofi/spotlight.rasi"))		        end,
              {description = "show rofi window switcher", group = "launcher"}),

    awful.key({ modkey,           }, "f",     function () 
              awful.util.spawn(file_manager) end,
              {description = "Open file explorer", group = "applications"}),
    awful.key({ modkey,           }, "Return", function () awful.spawn(terminal) end,
              {description = "open a terminal", group = "launcher"}),
    awful.key({ modkey, "Control" }, "r", awesome.restart,
              {description = "reload awesome", group = "awesome"}),
    awful.key({ modkey, "Shift"   }, "q", awesome.quit,
              {description = "quit awesome", group = "awesome"}),

    awful.key({ modkey,           }, "l",     function () awful.tag.incmwfact( 0.05)          end,
              {description = "increase master width factor", group = "layout"}),
    awful.key({ modkey,           }, "h",     function () awful.tag.incmwfact(-0.05)          end,
              {description = "decrease master width factor", group = "layout"}),
    awful.key({ modkey, "Shift"   }, "h",     function () awful.tag.incnmaster( 1, nil, true) end,
              {description = "increase the number of master clients", group = "layout"}),
    awful.key({ modkey, "Shift"   }, "l",     function () awful.tag.incnmaster(-1, nil, true) end,
              {description = "decrease the number of master clients", group = "layout"}),
    awful.key({ modkey, "Control" }, "h",     function () awful.tag.incncol( 1, nil, true)    end,
              {description = "increase the number of columns", group = "layout"}),
    awful.key({ modkey, "Control" }, "l",     function () awful.tag.incncol(-1, nil, true)    end,
              {description = "decrease the number of columns", group = "layout"}),
    awful.key({ modkey,           }, "space", function () awful.layout.inc( 1)                end,
              {description = "select next", group = "layout"}),
    awful.key({ modkey, "Shift"   }, "space", function () awful.layout.inc(-1)                end,
              {description = "select previous", group = "layout"}),

    awful.key({ modkey, "Control" }, "n",
              function ()
                  local c = awful.client.restore()
                  -- Focus restored client
                  if c then
                    c:emit_signal(
                        "request::activate", "key.unminimize", {raise = true}
                    )
                  end
              end,
              {description = "restore minimized", group = "client"}),

    -- Menubar
    awful.key({ modkey }, "p", function() menubar.show() end,
              {description = "show the menubar", group = "launcher"}),
    awful.key({modkey}, "o", awful.client.movetoscreen)
)

clientkeys = gears.table.join(
  awful.key({ modkey, "Shift"   }, "f",
    function (c)
        c.fullscreen = not c.fullscreen
        c:raise()
    end,
    {description = "toggle fullscreen", group = "client"}),
  awful.key({ modkey, 					}, "q",      function (c) c:kill()                         end,
            {description = "close", group = "client"}),
  awful.key({ modkey, "Control" }, "space",  awful.client.floating.toggle                     ,
            {description = "toggle floating", group = "client"}),
  awful.key({ modkey, "Control" }, "Return", function (c) c:swap(awful.client.getmaster()) end,
            {description = "move to master", group = "client"}),
  awful.key({ modkey,           }, "o",      function (c) c:move_to_screen()               end,
            {description = "move to screen", group = "client"}),
  awful.key({ modkey,           }, "t",      function (c) c.ontop = not c.ontop            end,
            {description = "toggle keep on top", group = "client"}),
  awful.key({ modkey,           }, "n",
      function (c)
          -- The client currently has the input focus, so it cannot be
          -- minimized, since minimized clients can't have the focus.
          c.minimized = true
      end ,
      {description = "minimize", group = "client"}),
  awful.key({ modkey,           }, "m",
      function (c)
          c.maximized = not c.maximized
          c:raise()
      end ,
      {description = "(un)maximize", group = "client"}),
  awful.key({ modkey, "Control" }, "m",
      function (c)
          c.maximized_vertical = not c.maximized_vertical
          c:raise()
      end ,
      {description = "(un)maximize vertically", group = "client"}),
  awful.key({ modkey, "Shift"   }, "m",
      function (c)
          c.maximized_horizontal = not c.maximized_horizontal
          c:raise()
      end ,
      {description = "(un)maximize horizontally", group = "client"})
)

clientbuttons = gears.table.join(
  awful.button({ }, 1, function (c)
    c:emit_signal("request::activate", "mouse_click", {raise = true})
  end),
  awful.button({ modkey }, 1, function (c)
    c:emit_signal("request::activate", "mouse_click", {raise = true})
    awful.mouse.client.move(c)
  end),
  awful.button({ modkey }, 3, function (c)
    c:emit_signal("request::activate", "mouse_click", {raise = true})
    awful.mouse.client.resize(c)
  end)
)
