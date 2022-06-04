#!/bin/bash

START_DIR=$(pwd)

source ./install-yay.bash $START_DIR

# install some packages
yay -S --noconfirm menulibre ttf-delugia-code visual-studio-code-bin microsoft-edge-stable-bin

# set gnome keybindings
dconf load /org/gnome/shell/keybindings/ < shell-keybindings
dconf load /org/gnome/desktop/wm/keybindings/ < wm-keybindings
dconf load /org/gnome/settings-daemon/plugins/media-keys/ < media-keybindings

source ./personalize-bash.bash
