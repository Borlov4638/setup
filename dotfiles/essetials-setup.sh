#!/usr/bin/env bash
set -e

echo "[*] Dependencies installation..."

packages=(
  "stow:stow"
  "tmux:tmux"
  "zsh:zsh"
  "zoxide:zoxide"
  "ssh:openssh"
  "kitty:kitty"
  "docker:docker"
  "docker-compose:docker-compose"
)

for pkg in "${packages[@]}"; do
  IFS=':' read -r cmd_name pkg_name <<<"$pkg"

  if ! command -v "$cmd_name" &>/dev/null; then
    echo "  -> "$cmd_name" not found, installing..."
    sudo pacman -S --noconfirm "$pkg_name"
  else
    echo "  -> "$cmd_name" already installed"
  fi
done

echo "[*] Installing TPM (Tmux Plugin Manager)..."
if [ ! -d "$HOME/.tmux/plugins/tpm" ]; then
  echo "  -> cloning TPM..."
  git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
else
  echo "  -> TPM already installed"
fi

echo "[*] Installing nvim..."
packages=(
  "nvim:nvim"
  "lazygit:lazygit"
  "rg:ripgrep"
  "fzf:fzf"
  "fd:fd"
  "luarocks:luarocks"
)

for pkg in "${packages[@]}"; do
  IFS=':' read -r cmd_name pkg_name <<<"$pkg"

  if ! command -v "$cmd_name" &>/dev/null; then
    echo "  -> "$cmd_name" not found, installing..."
    sudo pacman -S --noconfirm "$pkg_name"
  else
    echo "  -> "$cmd_name" already installed"
  fi
done

if [ ! -d "/usr/share/fonts/TTF" ]; then
  echo "  -> Installing fonts..."
  sudo pacman -S --noconfirm ttf-jetbrains-mono-nerd
else
  echo "  -> fonts already installed"
fi

echo "[*] Installing nvm..."
if [ ! -d "$HOME/.nvm" ]; then
  echo "  -> installing nvm..."
  curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.3/install.sh | bash
fi

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

if ! command -v node &>/dev/null; then
  echo "  -> installing Node.js 22..."
  nvm install 22
else
  echo "  -> Node.js already installed"
fi

echo "[*] Installing rust..."
if ! command -v cargo &>/dev/null; then
  echo "  -> installing rust..."
  curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
fi

echo "[*] dotfiles installation..."
DOTFILES_DIR="$(cd "$(dirname "$0")" && pwd)"
cd "$DOTFILES_DIR"

stow -t ~ zsh || true
stow -t ~ tmux || true
stow -t ~ kitty || true
stow -t ~ nvim || true

echo "[*] Done"
