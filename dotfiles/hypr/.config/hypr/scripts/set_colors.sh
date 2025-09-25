#!/bin/bash
echo "WAL: using $CURRENT_WALLPAPER" >>/tmp/wal.log
wal -i $CURRENT_WALLPAPER -n
