#!/usr/bin/env bash
set -e

echo "[*] Установка зависимостей..."

packages=(
  "stow:stow"
  "tmux:tmux"
  "zsh:zsh"
  "kitty:kitty"
)

for pkg in "${packages[@]}"; do
  IFS=':' read -r cmd_name pkg_name <<<"$pkg"

  if ! command -v "$cmd_name" &>/dev/null; then
    echo "  -> "$cmd_name" не найден, ставим..."
    sudo pacman -S --noconfirm "$pkg_name"
  else
    echo "  -> "$cmd_name" уже установлен"
  fi
done

echo "[*] Установка TPM (Tmux Plugin Manager)..."
if [ ! -d "$HOME/.tmux/plugins/tpm" ]; then
  echo "  -> клонируем TPM..."
  git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
else
  echo "  -> TPM уже установлен"
fi

echo "[*] Установка nvim..."
packages=(
  "nvim:nvim"
  "rg:ripgrep"
  "fd:fd"
  "luarocks:luarocks"
)

for pkg in "${packages[@]}"; do
  IFS=':' read -r cmd_name pkg_name <<<"$pkg"

  if ! command -v "$cmd_name" &>/dev/null; then
    echo "  -> "$cmd_name" не найден, ставим..."
    sudo pacman -S --noconfirm "$pkg_name"
  else
    echo "  -> "$cmd_name" уже установлен"
  fi
done

stow -t ~ nvim || true

if [ ! -d "/usr/share/fonts/TTF" ]; then
  echo "  -> Ставим шрифты..."
  sudo pacman -S --noconfirm ttf-jetbrains-mono-nerd
else
  echo "  -> Шрифты уже установлены"
fi

echo "[*] Разворачивание dotfiles..."
DOTFILES_DIR="$(cd "$(dirname "$0")" && pwd)"
cd "$DOTFILES_DIR"

stow -t ~ zsh || true
stow -t ~ tmux || true
stow -t ~ kitty || true

echo "[*] Готово! 🚀"
echo "Открой tmux и нажми <prefix> + I для установки плагинов."
