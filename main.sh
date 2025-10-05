#!/bin/bash

art="
██████╗ ██████╗  ██████╗ ███╗   ███╗███████╗███████╗███████╗██╗      █████╗ ███╗   ██╗██████╗ 
██╔══██╗██╔══██╗██╔═══██╗████╗ ████║██╔════╝██╔════╝██╔════╝██║     ██╔══██╗████╗  ██║██╔══██╗
██████╔╝██████╔╝██║   ██║██╔████╔██║█████╗  ███████╗█████╗  ██║     ███████║██╔██╗ ██║██║  ██║
██╔═══╝ ██╔══██╗██║   ██║██║╚██╔╝██║██╔══╝  ╚════██║██╔══╝  ██║     ██╔══██║██║╚██╗██║██║  ██║
██║     ██║  ██║╚██████╔╝██║ ╚═╝ ██║███████╗███████║███████╗███████╗██║  ██║██║ ╚████║██████╔╝
╚═╝     ╚═╝  ╚═╝ ╚═════╝ ╚═╝     ╚═╝╚══════╝╚══════╝╚══════╝╚══════╝╚═╝  ╚═╝╚═╝  ╚═══╝╚═════╝ "

echo -e "\n$art\n"

sudo pacman -Syu --noconfirm --needed git

# Use custom repo if specified, otherwise default
SETUP_REPO="${SETUP_REPO:-Borlov4638/setup}"

echo -e "\nClonning installaion repo from https://github.com/${ISTALLATION_REPO}.git"
rm -rf ~/.local/share/setup
git clone "https://github.com/${SETUP_REPO}.git" ~/.local/share/setup >/dev/null

echo -e "\nInstallation Starting..."

source ~/.local/share/setup/install.sh
