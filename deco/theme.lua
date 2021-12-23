---------------------------
-- Default awesome theme --
---------------------------

local theme_assets = require("beautiful.theme_assets")
local xresources = require("beautiful.xresources")
local dpi = xresources.apply_dpi

local gfs = require("gears.filesystem")
local themes_path = gfs.get_themes_dir()

local theme = {}

-- Colors
theme.black_light = "#60647C"
theme.black = "#414455"
theme.black_dark = "#333643"
theme.red_light = "#C87E86"
theme.red = "#BA5F68"
theme.red_dark = "#9D434C"
theme.green_light = "#B4C6A1"
theme.green = "#A0B788"
theme.green_dark = "#82A061"
theme.yellow_light = "#EACF9D"
theme.yellow = "#E5C384"
theme.yellow_dark = "#D8A649"
theme.blue_light = "#99B1CA"
theme.blue = "#7F9DBC"
theme.blue_dark = "#577EA6"
theme.purple_light = "#BEA1B9"
theme.purple = "#AD8AA8"
theme.purple_dark = "#93668C"
theme.cyan_light = "#9CC9D3"
theme.cyan = "#82BAC7"
theme.cyan_dark = "#56A2B3"
theme.gray_light = "#DADDE7"
theme.gray = "#D0D4E0"
theme.gray_dark = "#9CA5BF"

theme.font          = "Roboto 10"

theme.bg_normal     = theme.black_dark
theme.bg_focus      = theme.black
theme.bg_urgent     = theme.red
theme.bg_minimize   = theme.black
theme.bg_systray    = theme.black_dark

theme.fg_normal     = theme.gray_dark
theme.fg_focus      = theme.gray_light
theme.fg_urgent     = theme.gray_light
theme.fg_minimize   = theme.gray_light

theme.useless_gap   = dpi(6)
theme.border_width  = dpi(1)
theme.border_normal = theme.black
theme.border_focus  = theme.black_dark
theme.border_marked = theme.red


-- There are other variable sets
-- overriding the default one when
-- defined, the sets are:
-- taglist_[bg|fg]_[focus|urgent|occupied|empty|volatile]
-- tasklist_[bg|fg]_[focus|urgent]
-- titlebar_[bg|fg]_[normal|focus]
-- tooltip_[font|opacity|fg_color|bg_color|border_width|border_color]
-- mouse_finder_[color|timeout|animate_timeout|radius|factor]
-- prompt_[fg|bg|fg_cursor|bg_cursor|font]
-- hotkeys_[bg|fg|border_width|border_color|shape|opacity|modifiers_fg|label_bg|label_fg|group_margin|font|description_font]
-- Example:
--theme.taglist_bg_focus = "#ff0000"

-- Generate taglist squares:
local taglist_square_size = dpi(4)
theme.taglist_squares_sel = theme_assets.taglist_squares_sel(
    taglist_square_size, theme.fg_normal
)
theme.taglist_squares_unsel = theme_assets.taglist_squares_unsel(
    taglist_square_size, theme.fg_normal
)

-- Variables set for theming notifications:
-- notification_font
-- notification_[bg|fg]
-- notification_[width|height|margin]
-- notification_[border_color|border_width|shape|opacity]

-- Variables set for theming the menu:
-- menu_[bg|fg]_[normal|focus]
-- menu_[border_color|border_width]
theme.menu_submenu_icon = themes_path.."default/submenu.png"
theme.menu_height = dpi(15)
theme.menu_width  = dpi(100)

-- For tabbar
theme.tabbar_ontop = false
theme.tabbar_bg_focus = theme.red
theme.tabbar_bg_focus = theme.yellow
theme.tabbar_position = "bottom"
theme.tabber_style = "boxes"

-- You can use your own layout icons like this:
theme.layout_fairh = themes_path.."default/layouts/fairhw.png"
theme.layout_fairv = themes_path.."default/layouts/fairvw.png"
theme.layout_floating  = themes_path.."default/layouts/floatingw.png"
theme.layout_magnifier = themes_path.."default/layouts/magnifierw.png"
theme.layout_max = themes_path.."default/layouts/maxw.png"
theme.layout_fullscreen = themes_path.."default/layouts/fullscreenw.png"
theme.layout_tilebottom = themes_path.."default/layouts/tilebottomw.png"
theme.layout_tileleft   = themes_path.."default/layouts/tileleftw.png"
theme.layout_tile = themes_path.."default/layouts/tilew.png"
theme.layout_tiletop = themes_path.."default/layouts/tiletopw.png"
theme.layout_spiral  = themes_path.."default/layouts/spiralw.png"
theme.layout_dwindle = themes_path.."default/layouts/dwindlew.png"
theme.layout_cornernw = themes_path.."default/layouts/cornernww.png"
theme.layout_cornerne = themes_path.."default/layouts/cornernew.png"
theme.layout_cornersw = themes_path.."default/layouts/cornersww.png"
theme.layout_cornerse = themes_path.."default/layouts/cornersew.png"

-- Generate Awesome icon:
theme.awesome_icon = theme_assets.awesome_icon(
    theme.menu_height, theme.bg_focus, theme.fg_focus
)

-- Define the icon theme for application icons. If not set then the icons
-- from /usr/share/icons and /usr/share/icons/hicolor will be used.
theme.icon_theme = nil

return theme

-- vim: filetype=lua:expandtab:shiftwidth=4:tabstop=8:softtabstop=4:textwidth=80
