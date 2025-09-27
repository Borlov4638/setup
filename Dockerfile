# Базовый образ Arch Linux
FROM archlinux:latest

# Обновляем систему и ставим базовые пакеты 
RUN pacman -Syu --noconfirm && \
    pacman -S --noconfirm git sudo base-devel wget vim

# Создаём пользователя для тестов
RUN useradd -m -G wheel tester && \
    echo "tester ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers

USER tester
WORKDIR /home/tester

# Точка входа — bash (можно поменять на zsh, если в dotfiles)
CMD ["/bin/bash"]
