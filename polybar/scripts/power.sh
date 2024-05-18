#!/bin/sh

config="$(xdg-user-dir)/.config/rofi/power.rasi"
script_dir="$(cd "$(dirname "$0")" >/dev/null 2>&1 && pwd)"

shutdown=" "
reboot="󰝳 "
lock=" "
suspend="󰒲 "
logout="󰍃 "

chosen="$(printf "%s\n%s\n%s\n%s\n%s\n" "$shutdown" "$reboot" "$lock" "$suspend" "$logout" | rofi -theme "$config" -dmenu -p "$(uptime -p)")"

execute() {
	yad --title "Are you sure you want to $2?" --button "Yes":0 --button "No":1 --buttons-layout center --center --on-top --fixed --no-escape --width=200
	exit=$?

	if [ "$exit" -eq 0 ]; then
		$1
	fi
}

case "$chosen" in
"$shutdown")
	execute "shutdown" "shutdown"
	;;
"$reboot")
	execute "reboot" "reboot"
	;;
"$lock")
	execute "cinnamon-screensaver-command --lock" "lock"
	;;
"$suspend")
	execute "playerctl -a stop && systemctl suspend" "suspend"
	;;
"$logout")
	execute "kill -9 -1" "quit"
	;;
esac
