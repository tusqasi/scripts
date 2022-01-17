#!/bin/bash
# second screen resolution (check with xrandr on second laptop)
W=1366
H=768

# extra output of your server machine.(DP-1, HDMI-0 etc. check with xrandr )
O=HDMI-0
if [ "$1" == "create" ]; then
    # create a fake output and add it
    xrandr --output $O --auto
    gtf $W $H 60 | sed '3q;d' | sed 's/Modeline//g' | xargs xrandr --newmode
      # sed: get third line, delete 'Modeline', get first word, remove first and last characters
    gtf $W $H 60 | sed '3q;d' | sed 's/Modeline//g' | awk '{print $1;}' | sed 's/^.\(.*\).$/\1/' | xargs xrandr --addmode $O
    gtf $W $H 60 | sed '3q;d' | sed 's/Modeline//g' | awk '{print $2;}' | sed 's/^.\(.*\).$/\1/' | xargs xrandr --output $O --right-of DP-2 --mode
elif [ "$1" == "on" ]; then
    # start vnc server
    x11vnc  -nocursorshape -nocursorpos -noxinerama -repeat -forever -clip ${W}x${H}+1921+0
elif [ "$1" == "off" ]; then
    xrandr --output $O --off
else
  echo "missing argument: [create | on]"
fi
