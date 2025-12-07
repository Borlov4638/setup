#!/bin/sh

status=$(systemctl is-active v2raya 2>/dev/null)
if [ $status = "active" ]; then
  systemctl stop v2raya
  echo "v2ray[-]"
else
  systemctl restart v2raya
  echo "v2ray[+]"
fi

#NOTE: need polkit rule for service start/stop
