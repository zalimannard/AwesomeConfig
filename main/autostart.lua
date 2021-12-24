local awful = require("awful")


local autostart_apps =
{
    "blueman-applet",
}


for app = 1, #autostart_apps do
    awful.spawn.single_instance(autostart_apps[app], awful.rules.rules)
end


local autostart_commands =
{
    "xrandr --output DP-1 --mode 1920x1080",
    "picom --experimental-backends",
    "xrandr --output DP-1 --mode 1920x1080",
    "setxkbmap -layout 'us,ru' -option 'grp:alt_shift_toggle'",
    "pamixer --set-volume 70",
    "xinput set-prop 'Wacom Cintiq Pro 16 Touch Finger' 'Coordinate Transformation Matrix' 0.5 0 0.5 0 1 0 0 0 1",
}


for command = 1, #autostart_commands do
    awful.spawn.with_shell(autostart_commands[command])
end

