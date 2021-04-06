#!/bin/fish

# This is the startup script.


pactl set-sink-mute 0 1
firefox &
xmodmap ~/.xmodmap 
xcape -e 'Control_R=Escape' -t 400
~/scripts/notify.fish  & 
~/scripts/battery_notify.fish &
alacritty &
picom  &
polybar example &
unclutter --timeout 2  &
copyq &
