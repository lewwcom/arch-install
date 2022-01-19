START_DIR=$(pwd)

source ./install-yay.bash $START_DIR

# install some packages
yay -S menulibre ttf-delugia-code visual-studio-code-bin

# install gnome extension
git clone --depth=1 https://github.com/micheleg/dash-to-dock.git ~/dash-to-dock
cd ~/dash-to-dock
make
make install

git clone --depth=1 https://github.com/aunetx/blur-my-shell ~/blur-my-shell
cd ~/blur-my-shell
make install

cd $START_DIR
rm -rf ~/{dash-to-dock,blur-my-shell}

# install WhiteSur theme
git clone https://github.com/vinceliuice/WhiteSur-gtk-theme.git ~/WhiteSur-gtk-theme
cd ~/WhiteSur-gtk-theme
./install.sh -i arch
./tweaks.sh -d

echo; read -p "Initialize Firefox then press ENTER to continue"
EDITOR=vim ./tweaks.sh -e

sudo ./tweaks.sh -g
git checkout wallpapers
sudo ./install-gnome-backgrounds.sh

git clone --depth=1 https://github.com/vinceliuice/WhiteSur-icon-theme.git ~/WhiteSur-icon-theme
cd ~/WhiteSur-icon-theme
./install.sh

cd $START_DIR
rm -rf ~/WhiteSur*

# set gnome keybindings
dconf load /org/gnome/shell/keybindings/ < shell-keybindings
dconf load /org/gnome/desktop/wm/keybindings/ < wm-keybindings
dconf load /org/gnome/settings-daemon/plugins/media-keys/ < media-keybindings

# gnome-terminal theme
echo; read -p "Create gnome-terminal named profile then press ENTER to continue"
git clone --depth=1 https://github.com/Mayccoll/Gogh.git ~/Gogh
cd ~/Gogh/themes
./monokai-pro.sh

cd $START_DIR
rm -rf ~/Gogh

source ./personalize-bash.bash

echo; echo "Restart gnome-shell then enable dash-to-dock, blur-my-shell and user-theme extension"
echo "Don't forget to change theme, icon and background!"

