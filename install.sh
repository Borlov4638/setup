#!/bin/bash

set -eEo pipefail

export SETUP_PATH="$HOME/.local/share/setup"
export DOTFILES_PATH="$SETUP_PATH/dotfiles"
export INSTALL_PATH="$SETUP_PATH/install"

echo $INSTALL_PATH
echo $DOTFILES_PATH
source "$DOTFILES_PATH/init.sh"
source "$INSTALL_PATH/all-install.sh"
