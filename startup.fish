#!/bin/fish

# This is the startup script.


pactl set-sink-mute 0 1
firefox &
xmodmap ~/.xmodmap 
xcape -e 'Control_R=Escape' -t 400
~/scripts/battery_notify.fish &
picom &
copyq &
nm-applet &
volctl &
feh ~/Pictures/Wallpapers/light_mode/950834.png --bg-max
lxpolkit &
xfce4-power-manager &
