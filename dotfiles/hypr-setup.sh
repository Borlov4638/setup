#!/usr/bin/env bash
set -e

echo "[*] Установка зависимостей hyprland..."

# Массив пакетов для установки
packages=(
  "hyprland:hyprland"
  "hyprpaper:hyprpaper"
  "hyprlock:hyprlock"
  "waybar:waybar"
  "rofi:rofi-wayland"
  "mako:mako"
  "blueman-applet:blueman"
  "NetworkManager:networkmanager"
)

for pkg in "${packages[@]}"; do
  IFS=':' read -r cmd_name pkg_name <<<"$pkg"

  if ! command -v "$cmd_name" &>/dev/null; then
    echo "  -> $cmd_name не найден, ставим..."
    sudo pacman -S --noconfirm "$pkg_name"
  else
    echo "  -> $cmd_name уже установлен"
  fi
done

echo "[*] Разворачивание dotfiles..."
DOTFILES_DIR="$(cd "$(dirname "$0")" && pwd)"
cd "$DOTFILES_DIR"

# Цикл для stow
configs=("hypr" "rofi" "waybar" "mako")
for config in "${configs[@]}"; do
  stow -t ~ "$config" || true
done

echo "[*] hyprland, hyprlock, hyprpaper, rofi, waybar установлены и настроены!"
