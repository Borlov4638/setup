#!/bin/sh

status=$(playerctl status 2>/dev/null)
if [ $status = "Playing" ]; then
  playerctl metadata --format="  {{ artist }} - {{ title }}"
else
  echo ""
fi
