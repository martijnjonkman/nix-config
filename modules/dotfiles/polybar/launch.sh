#!/usr/bin/env bash

# Kill all running polybar instances (SIGTERM first, then SIGKILL)
pkill -x polybar 2>/dev/null || true
sleep 0.5
pkill -9 -x polybar 2>/dev/null || true
sleep 0.2

# Always launch the main bar on HDMI-A-0 (carries the system tray)
polybar main >> /tmp/polybar.log 2>&1 &
disown

# Launch the secondary bar on DisplayPort-1 only if it is connected
if xrandr --query | grep -q "^DisplayPort-1 connected"; then
  polybar secondary >> /tmp/polybar.log 2>&1 &
  disown
fi
