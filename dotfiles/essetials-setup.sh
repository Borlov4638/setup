#!/usr/bin/env bash
set -e

echo "[*] Установка зависимостей..."

packages=(
  "stow:stow"
  "tmux:tmux"
  "zsh:zsh"
  "zoxide:zoxide"
  "openssh:openssh"
  "kitty:kitty"
  "docker:docker"
  "docker-compose:docker-compose"
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
  "fzf:fzf"
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

if [ ! -d "/usr/share/fonts/TTF" ]; then
  echo "  -> Ставим шрифты..."
  sudo pacman -S --noconfirm ttf-jetbrains-mono-nerd
else
  echo "  -> Шрифты уже установлены"
fi

echo "[*] Установка nvm..."
if [ ! -d "$HOME/.nvm" ]; then
  echo "  -> ставим nvm..."
  curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.3/install.sh | bash
fi

# Подключаем nvm в текущий скрипт
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

# Теперь можно ставить Node.js
if ! command -v node &>/dev/null; then
  echo "  -> ставим Node.js 22..."
  nvm install 22
else
  echo "  -> Node.js уже установлен"
fi

echo "[*] Разворачивание dotfiles..."
DOTFILES_DIR="$(cd "$(dirname "$0")" && pwd)"
cd "$DOTFILES_DIR"

stow -t ~ zsh || true
stow -t ~ tmux || true
stow -t ~ kitty || true
stow -t ~ nvim || true

echo "[*] Готово! 🚀"
echo "Открой tmux и нажми <prefix> + I для установки плагинов."
