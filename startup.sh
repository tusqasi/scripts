#!/usr/bin/env zsh

# This is the startup script.


pactl set-sink-mute 0 1 &
firefox&
xmodmap ~/.xmodmap &
xcape -e 'Control_R=Escape' -t 400 &
picom &
dunst &
copyq &
nm-applet &
volctl &
~/scripts/battery_notify.py &
feh ~/Pictures/Wallpapers/light_mode/950834.png --bg-max
lxpolkit &
unclutter --timeout 3 &
alacritty -e tmux new -A -s "sys" &
