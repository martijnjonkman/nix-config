#!/usr/bin/env bash

# Kill any running polybar instances
pkill -x polybar || true
sleep 0.3

# Wait until processes have been shut down (max 3 seconds)
timeout=30
while pgrep -u "$UID" -x polybar > /dev/null; do
  sleep 0.1
  timeout=$((timeout - 1))
  if [ "$timeout" -le 0 ]; then
    pkill -9 -x polybar || true
    break
  fi
done

# Always launch the main bar on HDMI-A-0 (carries the system tray)
polybar main >> /tmp/polybar.log 2>&1 &
disown

# Launch the secondary bar on DisplayPort-1 only if it is connected
if xrandr --query | grep -q "^DisplayPort-1 connected"; then
  polybar secondary >> /tmp/polybar.log 2>&1 &
  disown
fi
