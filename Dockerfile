# Base Arch Linux image
FROM archlinux:latest

RUN pacman -Syu --noconfirm && \
    pacman -S --noconfirm git sudo base-devel wget vim

RUN useradd -m -G wheel tester && \
    echo "tester ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers

USER tester
WORKDIR /home/tester

RUN git clone https://github.com/Borlov4638/setup.git
# RUN cd setup
# RUN pwd
# RUN chmod +x ./main.sh
RUN ./setup/main.sh -e


CMD ["/bin/bash"]
