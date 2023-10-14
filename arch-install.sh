#!/bin/bash

ESSENTIAL_PACKAGES="sudo polkit vim ranger git base-devel man-db man-pages texinfo tldr neofetch wget zip unzip starship bash-completion tree bat httpie htop dictd glow difftastic go-yq mcfly bc yt-dlp"

echo "Platform: 1. WSL, 2. Virtual machine (VMWare - UEFI)"
read -p "Which platform to install? "
case $REPLY in
    1) source ./arch-install-wsl.sh;;
    2) source ./arch-install-vm.sh;;
esac

