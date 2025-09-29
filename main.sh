#!/usr/bin/env bash

set -e

MAIN_DIR="$(cd "$(dirname "$0")" && pwd)"

show_help() {
  echo "Usage: $0 [OPTIONS]"
  echo ""
  echo "Options:"
  echo "  -a, --all        Install all"
  echo "  -e, --essentials Install essetial dependencies"
  echo "  -h, --hypr       Install Hyprland"
  echo "  --help           Show help "
}

run_essentials() {
  echo "Starting essentials installation"
  "$MAIN_DIR/dotfiles/essetials-setup.sh"
}

run_hypr() {
  echo "Starting Hyprland installation..."
  "$MAIN_DIR/dotfiles/hypr-setup.sh"
}

if [[ $# -eq 0 ]]; then
  show_help
  exit 0
fi

while [[ $# -gt 0 ]]; do
  case $1 in
  -a | --all)
    run_essentials
    run_hypr
    shift
    ;;
  -e | --essentials)
    run_essentials
    shift
    ;;
  -h | --hypr)
    run_hypr
    shift
    ;;
  --help)
    show_help
    exit 0
    ;;
  *)
    echo "Unknown argument: $1"
    show_help
    exit 1
    ;;
  esac
done

echo "Done"
