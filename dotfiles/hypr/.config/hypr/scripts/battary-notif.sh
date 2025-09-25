#!/bin/bash

LOW_BATTERY_THRESHOLD=20
CRITICAL_BATTERY_THRESHOLD=5

STATE_FILE="/tmp/battery_notification_state"

while true; do
  battery_status=$(upower -i /org/freedesktop/UPower/devices/battery_BAT1 | grep -E "state" | awk '{print $2}')
  battery_percent=$(upower -i /org/freedesktop/UPower/devices/battery_BAT1 | grep -E "percentage" | awk '{print $2}' | tr -d '%')

  if [[ "$battery_status" == "discharging" ]]; then
    if ((battery_percent <= LOW_BATTERY_THRESHOLD)) && ((battery_percent > CRITICAL_BATTERY_THRESHOLD)); then
      if [[ ! -f $STATE_FILE || $(cat $STATE_FILE) != "low" ]]; then
        notify-send -u critical "Low battery 🧈!" "${battery_percent}%"
        echo "low" >$STATE_FILE
      fi
    elif ((battery_percent <= CRITICAL_BATTERY_THRESHOLD)); then
      if [[ ! -f $STATE_FILE || $(cat $STATE_FILE) != "critical" ]]; then
        notify-send -u critical "🧈🧈🧈CRITICAL BATTERY CHARGE🧈🧈🧈!" "${battery_percent}%"
        echo "critical" >$STATE_FILE
      fi
    else
      rm -f $STATE_FILE
    fi
  else
    rm -f $STATE_FILE
  fi

  sleep 30s
done
