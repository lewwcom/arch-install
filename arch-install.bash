#!/bin/bash

ESSENTIAL_PACKAGES="sudo polkit vim ranger git base-devel man-db man-pages texinfo tldr neofetch wget zip"

echo "Platform: 1. WSL, 2. VMWare, 3. Real machine"
read -p "Which platform to install? "
case $REPLY in
    1) source ./arch-install-wsl.bash;;
    2) source ./arch-install-vmware.bash;;
esac

