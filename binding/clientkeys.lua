-- Standard Awesome library
local gears = require("gears")
local awful = require("awful")
-- Custom Local Library
-- local titlebar = require("anybox.titlebar")

local _M = {}
local modkey = RC.vars.modkey

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --

function _M.get()
  local clientkeys = gears.table.join(
    awful.key({ modkey }, "f",
        function (c)
            c.fullscreen = not c.fullscreen
            c:raise()
        end,
        {description = "Переключить полноэкранный ражим",
        group = "Окна"}),

    awful.key({ modkey, "Shift" }, "c",
        function (c) c:kill() end,
        {description = "close", 
        group = "Окна"}),

    awful.key({ modkey, "Control" }, "space",  
        awful.client.floating.toggle,
        {description = "Переключить плавающий режим", 
        group = "Окна"}),


    awful.key({ modkey, "Control" }, "Return",
        function (c) c:swap(awful.client.getmaster()) end,
        {description = "Сделать основным", 
        group = "Окна"}),

    awful.key({ modkey }, "n",
        function (c)
            c.minimized = true
        end ,
        {description = "Свернуть", 
        group = "Окна"}),

    awful.key({ modkey }, "m",
        function (c)
            c.maximized = not c.maximized
            c:raise()
        end ,
        {description = "Расширить/Сжать", 
        group = "Окна"}),

    awful.key({ modkey, "Control" }, "m",
        function (c)
            c.maximized_vertical = not c.maximized_vertical
            c:raise()
        end ,
        {description = "Максимизировать по вертиткали/вернуть", 
        group = "Окна"}),

    awful.key({ modkey, "Shift" }, "m",
        function (c)
            c.maximized_horizontal = not c.maximized_horizontal
            c:raise()
        end ,
        {description = "Максимизировать по горизонтали/вернуть", 
        group = "Окна"})
  )

  return clientkeys
end

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --

return setmetatable({}, { __call = function(_, ...) return _M.get(...) end })
