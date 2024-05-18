#!/bin/bash

bar_pid=$(pgrep -a "polybar" | grep "main" | cut -d" " -f1)

players="spotify,%any,firefox,chromium,brave,mpd,mpv"
player_status=$(playerctl -p $players status 2>/dev/null)

script_dir=$(cd "$(dirname "$0")" >/dev/null 2>&1 && pwd)
exit=$?

update_hooks() {
	echo "$1" | while IFS= read -r id; do
		polybar-msg -p "$id" hook music-play-pause "$2" 1>/dev/null 2>&1
	done
}

if [ $exit -eq 0 ]; then
	status="$player_status"
else
	status="Offline"
fi

# Function to print truncated output
print_truncated() {
	local text="$1"
	echo "${text:0:20}..."
}

get_metadata() {
	playerctl -p $players metadata --format '{{ title }} - {{ artist }}' 2>/dev/null
}

case $player_status in
Stopped)
	if [ "$status" == "Stopped" ]; then
		echo "Nothing is being played"
	else
		echo "$status"
	fi
	;;
Paused)
	update_hooks "$bar_pid" 2
	get_metadata | while IFS= read -r line; do
		print_truncated "$line"
	done
	;;
Playing)
	update_hooks "$bar_pid" 1
	get_metadata | while IFS= read -r line; do
		print_truncated "$line"
	done
	;;
*)
	echo "Nothing is being played"
	;;
esac

case $1 in
--scroll)
	if [ "$player_status" == "Playing" ] || [ "$player_status" == "Paused" ]; then
		get_metadata | while IFS= read -r line; do
			print_truncated "$line"
		done
	else
		echo "Nothing is being played"
	fi
	;;
--next)
	if [ "$player_status" == "Playing" ] || [ "$player_status" == "Paused" ]; then
		playerctl -p $players next
	fi
	;;
--previous)
	if [ "$player_status" == "Playing" ] || [ "$player_status" == "Paused" ]; then
		playerctl -p $players previous
	fi
	;;
--toggle)
	if [ "$player_status" == "Playing" ] || [ "$player_status" == "Paused" ]; then
		playerctl -p $players play-pause
	fi
	;;
esac
