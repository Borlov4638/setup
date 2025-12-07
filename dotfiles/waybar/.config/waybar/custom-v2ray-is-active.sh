#!/bin/sh

status=$(systemctl is-active v2raya 2>/dev/null)
if [ $status = "active" ]; then
  echo "v2ray[+]"
else
  echo "v2ray[-]"
fi
