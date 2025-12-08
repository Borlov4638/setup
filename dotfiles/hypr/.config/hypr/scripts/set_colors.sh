#!/bin/bash
echo "WAL: using $CURRENT_WALLPAPER" >>/tmp/wal.log
wal --backend colorz -i $CURRENT_WALLPAPER -n
