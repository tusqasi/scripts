#!/bin/fish
while true
         set -g bat (acpi -b | cut -d',' -f 2-|cut -d',' -f1|cut -d'%' -f1)
         if test $bat -lt 20
             notify-send   --urgency=critical Warning! "Battery \n Quite low 20%"
	 else if test $bat -lt 30
             notify-send   --urgency=critical Warning! "Battery \n Low 30%"
	 else if test $bat -lt 50
             notify-send   --urgency=critical Warning! "Battery \n Low 50%"
         end
	 sleep 20s
     end
