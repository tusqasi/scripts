#!/bin/fish
while true
	# CONNECTED var stores weather charging or discharging 
	set -g CONNECTED (acpi -b | cut -d',' -f 1|cut -d':' -f2)

	if [ "$CONNECTED" = " Discharging" ]
	    # BAT
	    set -g BAT (acpi -b | cut -d',' -f 2-|cut -d',' -f1|cut -d'%' -f1)

	    echo "hdi"
	     if test $BAT -lt 20
		 notify-send   --urgency=critical Warning! "Battery \n Quite low 20%"
	     else if test $BAT -lt 30
		 notify-send   --urgency=critical Warning! "Battery \n Low 30%"
	     else if test $BAT -lt 50
		 notify-send   --urgency=critical Warning! "Battery \n Low 50%"
	     end
	     sleep 3m
	end

 end
