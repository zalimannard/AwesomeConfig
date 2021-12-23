local gears = require("gears")
local awful = require("awful")
local hotkeys_popup = require("awful.hotkeys_popup")
local menubar = require("menubar")
local bling = require("module.bling")

local modkey = RC.vars.modkey
local terminal = RC.vars.terminal

local _M = {}


function _M.get()
  local globalkeys = gears.table.join(


  -- Основные
  awful.key({}, "F1",
    hotkeys_popup.show_help,
    {description = "Показать помощь",
    group = "Awesome"}),

  awful.key({ modkey, "Control" }, "r",
    awesome.restart,
    {description = "Перезагрузить Awesome",
    group = "Awesome"}),

  awful.key({ modkey, "Shift" }, "q",
    awesome.quit,
    {description = "Выключить Awesome",
    group = "Awesome"}),


  -- Окна
  awful.key({ modkey }, "Left",
    function() awful.client.focus.bydirection("left")
    bling.module.flash_focus.flashfocus(client.focus) end,
    {description = "На окно влево",
    group = "Перемещение"}),
    
  awful.key({ modkey }, "Up",
    function() awful.client.focus.bydirection("up")
    bling.module.flash_focus.flashfocus(client.focus) end,
    {description = "На окно вверх",
    group = "Перемещение"}),
    
  awful.key({ modkey }, "Right",
    function() awful.client.focus.bydirection("right")
    bling.module.flash_focus.flashfocus(client.focus) end,
    {description = "На окно вправо",
    group = "Перемещение"}),
    
  awful.key({ modkey }, "Down",
    function() awful.client.focus.bydirection("down")
    bling.module.flash_focus.flashfocus(client.focus) end,
    {description = "На окно вниз",
    group = "Перемещение"}),

  awful.key({ modkey, "Shift" }, "k",
    function() awful.client.swap.byidx(-1) end,
    {description = "Сдвиг текущего окна",
    group = "Перемещение"}),


  -- Звук
    awful.key({ "Control", "Shift" }, "XF86AudioRaiseVolume",
        function() awful.spawn("pamixer -i 1") end,
        {description = "Увеличить громкость на 1",
        group = "Звук"}),

    awful.key({ "Control", "Shift" }, "XF86AudioLowerVolume",
        function() awful.spawn("pamixer -d 1") end,
        {description = "Уменьшить громкость на 1",
        group = "Звук"}),

    awful.key({}, "XF86AudioRaiseVolume",
        function() awful.spawn("pamixer -i 2") end,
        {description = "Увеличить громкость на 2",
        group = "Звук"}),

    awful.key({}, "XF86AudioLowerVolume",
        function() awful.spawn("pamixer -d 2") end,
        {description = "Уменьшить громкость на 2",
        group = "Звук"}),
    
    awful.key({ "Shift" }, "XF86AudioRaiseVolume",
        function() awful.spawn("pamixer -i 20") end,
        {description = "Увеличить громкость на 20",
        group = "Звук"}),

    awful.key({ "Shift" }, "XF86AudioLowerVolume",
        function() awful.spawn("pamixer -d 20") end,
        {description = "Уменьшить громкость на 20",
        group = "Звук"}),
    
    awful.key({}, "XF86AudioMute",
        function() awful.spawn("pamixer -t") end,
        {description = "Включить/Выключить звук",
        group = "Звук"}),


  -- Медиа
awful.key({ "Control" }, "\\",
        function() awful.spawn("playerctl play-pause") end,
        {description = "Остановить/Продолжить воспроизведение",
        group = "Медиа"}),

    awful.key({}, "XF86AudioPrev",
        function() awful.spawn("playerctl previous") end,
        {description = "Предыдущий трек",
        group = "Медиа"}),

    awful.key({}, "XF86AudioNext",
        function() awful.spawn("playerctl next") end,
        {description = "Следующий трек",
        group = "Медиа"}),

    awful.key({ "Control", modkey }, "Left",
        function() awful.spawn("playerctl previous") end,
        {description = "Предыдущий трек",
        group = "Медиа"}),

    awful.key({ "Control", modkey }, "Right",
        function() awful.spawn("playerctl next") end,
        {description = "Следующий трек",
        group = "Медиа"}),


  -- Скриншоты
      awful.key({}, "Print",
        function() awful.spawn("flameshot full -p '/home/zalimannard/Picture/Screenshots Full Screen'") end,
        {description = "Скриншот всего экрана",
        group = "Awesome"}),

    awful.key({ "Shift" }, "Print",
        function() awful.spawn("flameshot gui") end,
        {description = "Скриншот всего экрана",
        group = "Awesome"}),


  -- Яркость
      awful.key({}, "XF86MonBrightnessUp",
        function() awful.spawn("brightnessctl s +5%") end,
        {description = "Увеличить яркость",
        group = "Awesome"}),

    awful.key({}, "XF86MonBrightnessDown",
        function() awful.spawn("brightnessctl s 5%-") end,
        {description = "Уменьшить яркость",
        group = "Awesome"}),


  -- Приложения
    awful.key({ modkey }, "Return",
        function() awful.spawn("konsole") end,
        {description = "Открыть терминал",
        group = "Запуск"}),

    awful.key({ modkey }, "b",
        function() awful.spawn("yandex-browser-beta") end,
        {description = "Открыть браузер",
        group = "Запуск"}),

    awful.key({ modkey }, "d",
        function() awful.spawn("dolphin") end,
        {description = "Открыть Dolphin",
        group = "Запуск"}),

    awful.key({ modkey }, "i",
        function() awful.spawn("discord") end,
        {description = "Открыть Discord",
        group = "Запуск"}),

    awful.key({ modkey }, "k",
        function() awful.spawn("kate") end,
        {description = "Открыть текстовый редактор",
        group = "Запуск"}),

    awful.key({ modkey }, "s",
        function() awful.spawn("spotify") end,
        {description = "Открыть Spotify",
        group = "Запуск"}),


  -- Рабочие столы
      awful.key({ modkey, "Shift" }, "Left",
        awful.tag.viewprev,
        {description = "Переход на предыдущий рабочий стол",
        group = "Перемещение"}),

        awful.key({ modkey, "Shift" }, "Right",
        awful.tag.viewnext,
        {description = "Переход на следующий рабочий стол",
        group = "Перемещение"})
  )

  return globalkeys
end


return setmetatable({}, { __call = function(_, ...) return _M.get(...) end })
