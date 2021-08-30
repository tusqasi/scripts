#!/bin/fish
while true
	# CONNECTED var stores weather charging or discharging 
	set -g CONNECTED (acpi -b | cut -d',' -f 1|cut -d':' -f2)

	if [ "$CONNECTED" = " Discharging" ]
	    # BAT
	    set -g BAT (acpi -b | cut -d',' -f 2-|cut -d',' -f1|cut -d'%' -f1)

	     if test $BAT -lt 20
		 notify-send    Warning! "Battery \n Quite low $BAT"
	     else if test $BAT -lt 30
		 notify-send    Warning! "Battery \n Low $BAT"
	     else if test $BAT -lt 50
		 notify-send    Warning! "Battery \n Low $BAT"
	     end
	     sleep 10m
	end

 end
