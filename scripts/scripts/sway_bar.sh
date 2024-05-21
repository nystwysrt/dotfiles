#!/bin/bash

print_volume(){
        volume="$(amixer get Master | tail -n1 | sed -r 's/.*\[(.*)%\].*/\1/')"
        is_muted="$(amixer get Master | egrep "^  Mono"| cut -d"[" -f 4 | cut -d"]" -f 1)"
        
        if [[ $is_muted == on ]]; then
                echo -e "V:${volume}%"
        else
                echo -e "V:*muted*"
        fi
}

print_wifi(){
        ip=$(ip route get 8.8.8.8 2>/dev/null | grep -Eo 'src [0-9.]+' | grep -Eo '[0-9.]+')
        ssid=$(iw wlan0 link | awk '/SSID/ { print $2 }')
        
        case "$(cat /sys/class/net/w*/operstate 2>/dev/null)" in
                down) wifi_status="*down*";;
                up) wifi_status="$(awk '/^\s*w/ { print int($3 * 100 / 70)"%"}' /proc/net/wireless)" ;;
        esac

        printf "W:%s %s@%s" "$wifi_status" "$ssid" "$ip"
}

print_battery(){
	hash acpi || return 0
	charge="$(awk '{ sum += $1 } END { print sum }' /sys/class/power_supply/BAT*/capacity)"
        battery_status=$(acpi -V | grep "on-line")
	if test -z "$battery_status"
	then
        # On battery!
		echo -e "B:-${charge}%"
	else
		# On mains! no need to suspend
		echo -e "B:+${charge}%"
	fi
}

print_temp(){
        temp=$(sensors | awk '/Core 0/ {print $3}')
        echo -e "T:${temp}"
}

print_date(){
        date=$(date "+%Y-%m-%d(%a) %I:%M%p")
        echo -e "${date}"
}

echo "$(print_wifi) | $(print_temp) | $(print_volume) | $(print_battery) | $(print_date)"

