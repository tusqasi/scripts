#!/bin/fish

while echo "send notify";

paplay ~/Music/notfication/juntos.ogg
notify-send --urgency=critical Warning! "Move!" "Spine Straight" "Do a push up" "Do a squat"
sleep 1h 
end
