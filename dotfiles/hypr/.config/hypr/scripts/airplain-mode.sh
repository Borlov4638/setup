#!/bin/bash
if rfkill list | grep -q "Soft blocked: yes"; then
  rfkill unblock all
  notify-send "Режим полета ВЫКЛЮЧЕН"
else
  rfkill block all
  notify-send "Режим полета ВКЛЮЧЕН"
fi
