#!/usr/bin/env bash

MAIN_DIR="$(cd "$(dirname "$0")" && pwd)"
$MAIN_DIR/dotfiles/essetials-setup.sh
$MAIN_DIR/dotfiles/hypr-setup.sh
