local awful = require("awful")

local _M = {}

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --

function _M.get ()
  local layouts = {
    awful.layout.suit.tile.left,        -- 3:
    awful.layout.suit.tile,             -- 2:
    awful.layout.suit.spiral,             -- 8:
    awful.layout.suit.magnifier,          -- 12:
  }

  return layouts
end

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --

return setmetatable({}, { __call = function(_, ...) return _M.get(...) end })
