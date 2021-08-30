#!/usr/bin/env zsh

# This is the startup script.


pactl set-sink-mute 0 1 &
firefox &
xmodmap ~/.xmodmap 
xcape -e 'Control_R=Escape' -t 400 &
~/scripts/battery_notify.fish &
picom &
copyq &
nm-applet &
volctl &
~/scripts/battery_notify.fish &
feh Pictures/Wallpapers/950834.jpg --bg-max &
lxpolkit &
xfce4-power-manager &
alacritty -e zsh &
