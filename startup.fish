#!/bin/fish

# This is the startup script.


pactl set-sink-mute 0 1
brave &
xmodmap ~/.xmodmap 
xcape -e 'Control_R=Escape' -t 400
~/scripts/notify.fish  & 
~/scripts/battery_notify.fish &
picom  &
unclutter --timeout 2  &
copyq &
