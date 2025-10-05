#!/bin/bash

mapfile -t packages < <(grep -v '^#' "$INSTALL_PATH/essentials.packages" | grep -v '^$')
sudo pacman -S --noconfirm --needed "${packages[@]}"

source $INSTALL_PATH/scripts/index.sh
