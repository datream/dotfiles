#!/usr/bin/env sh

# Terminate already running bar instances
killall -q polybar
killall -q nm-applet

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# Launch polybar
polybar i3_polybar &
nm-applet
