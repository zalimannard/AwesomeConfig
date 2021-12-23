local gears = require("gears")
local awful = require("awful")

local _M = {}
local modkey = RC.vars.modkey


function _M.get(globalkeys)
  for i = 1, 9 do
    globalkeys = gears.table.join(globalkeys,
    
      -- Переход к рабочему столу
      awful.key({ modkey }, "#" .. i + 9,
        function ()
          local screen = awful.screen.focused()
          local tag = screen.tags[i]
          if tag then
            tag:view_only()
          end
        end,
        {description = "Перейти на стол "..i, group = "Тэги"}),

      -- Присоединение с рабочего стола
      awful.key({ modkey, "Control" }, "#" .. i + 9,
        function ()
          local screen = awful.screen.focused()
          local tag = screen.tags[i]
          if tag then
            awful.tag.viewtoggle(tag)
          end
        end,
        {description = "Присоединить всё со стола " .. i, group = "Тэги"}),
      
      -- Переместить окно на рабочий стол
      awful.key({ modkey, "Shift" }, "#" .. i + 9,
        function ()
          if client.focus then
            local tag = client.focus.screen.tags[i]
            if tag then
              client.focus:move_to_tag(tag)
            end
          end
        end,
        {description = "Переместить окно на стол "..i, group = "Тэги"}),
      
      -- Дублирование отображение окна на рабочий стол
      awful.key({ modkey, "Control", "Shift" }, "#" .. i + 9,
        function ()
          if client.focus then
            local tag = client.focus.screen.tags[i]
            if tag then
              client.focus:toggle_tag(tag)
            end
          end
        end,
        {description = "Продублировать окно на стол " .. i, group = "Тэги"})

    )
  end

  return globalkeys
end


return setmetatable({}, { __call = function(_, ...) return _M.get(...) end })
