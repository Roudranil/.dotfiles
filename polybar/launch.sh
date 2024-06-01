#!/usr/bin/env bash

# Terminate already running bar instances
# If all your bars have ipc enabled, you can use
polybar-msg cmd quit
# Otherwise you can use the nuclear option:
# killall -q polybar

# Launch bar1 and bar2
echo "---" | tee -a /tmp/polybar1.log /tmp/polybar2.log
polybar main 2>&1 | tee -a /tmp/polybar1.log &
# Get the list of connected displays
connected_displays=$(xrandr --query | grep " connected" | cut -d" " -f1)

# Check if there are two displays
if [ "$(echo "$connected_displays" | wc -l)" -eq 2 ]; then
	# Check if the second display is named HDMI-1
	second_display=$(echo "$connected_displays" | sed -n '2p')
	if [ "$second_display" = "HDMI-1" ]; then
		# Execute the command for two displays with the second being HDMI-1
		polybar second 2>&1 | tee -a /tmp/polybar2.log &
	fi
fi
sleep 5
polybar-msg cmd restart

echo "Bars launched..."
