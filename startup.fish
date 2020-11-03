#!/bin/fish

# This is the startup script.

# Gnome Shenanigans 
# gnome-flashback & 
/usr/lib/gsd-xsettings  &
/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1  &
# killall gnome-flashback  

pactl set-sink-mute 0 1
firefox &
xmodmap ~/.xmodmap
xcape -e 'Control_R=Escape' -t 400
~/scripts/notify.fish  & 
alacritty &
picom  &
variety &
polybar example &
unclutter --timeout 2  &
