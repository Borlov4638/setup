#!/bin/bash

set -eEo pipefail

# export SETUP_PATH="$HOME/.local/share/setup"
export SETUP_PATH=/home/karakul/personal/setup
export DOTFILES_PATH="$SETUP_PATH/dotfiles"
export INSTALL_PATH="$SETUP_PATH/install"

echo $INSTALL_PATH
echo $DOTFILES_PATH
source "$INSTALL_PATH/base-install.sh"
source "$DOTFILES_PATH/init.sh"
