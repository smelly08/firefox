#!/bin/bash
set -e

export DISPLAY=:1

# Start a virtual display
Xvfb :1 -screen 0 1280x800x16 &

# Start Fluxbox (lightweight window manager)
fluxbox &

# Start x11vnc server
x11vnc -display :1 -nopw -forever &

# Start noVNC on port 6080
websockify --web /usr/share/novnc/ 6080 localhost:5900 &

# Wait a little to ensure display is ready
sleep 3

# Launch Firefox automatically
firefox &

echo "Firefox GUI available at: https://$(hostname -f)-6080.preview.app.github.dev"
