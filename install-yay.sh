#!/bin/bash

git clone --depth=1 https://aur.archlinux.org/yay.git ~/yay
cd ~/yay
makepkg -si
cd ${1}
rm -rf ~/yay

# yay development packages upgrade
yay -Y --gendb --noconfirm
yay -Syu --devel --noconfirm
yay -Y --devel --save --noconfirm
