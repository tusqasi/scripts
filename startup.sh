#!/usr/bin/env bash

~/scripts/keyboard_setup &
alacritty -e tmux new-session -A -s "sys" &
xset b off
variety &
brave --force-device-scale-factor=1.25 &

if [[ $DESKTOP_SESSION == "i3" ]]; then
	echo "$DESKTOP_SESSION" thersldfjksjlkafj >> ~/.thatfils
	unclutter
	lxpolkit &
	picom  -bc
	copyq &
	dunst &
elif [[ $XDG_CURRENT_DESKTOP == "KDE" ]];then
	# echo "In kde plasma"
	# notify-send $desktop
	 true
elif [[ $DESKTOP_SESSION == "plasma" ]]; then
	# echo "In kde plasma"
	# notify-send $session
	true
else
	unclutter -idle 5 &
	lxpolkit &
	/usr/lib/polkit-kde-authentication-agent-1 &
	/usr/lib/pam_kwallet_init  
	volctl &
	nm-applet &
	picom &
	# feh ~/Pictures/Wallpapers/light_mode/graymountains.jpg --bg-fill &
	copyq &
	# firefox &
	# ~/scripts/battery_notify.py &
fi
