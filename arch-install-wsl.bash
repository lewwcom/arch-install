#!/bin/bash

rm /.dockerenv

# allow install man-pages
sed -i "s/NoExtract[[:space:]]*=[[:space:]]*usr\/share\/man\/\*/# &/" /etc/pacman.conf

# install essential packages
pacman-key --init
pacman -Syyu
pacman -Sy $ESSENTIAL_PACKAGES go

# ping needs to be able to create a raw network socket ~ privileged action
# add SUID (set owner user ID up on execution) permission for superuser's ping
chmod u+s $(which ping)

# create user
echo; read -p "Username: " USER_NAME
useradd -m -G wheel $USER_NAME
passwd $USER_NAME
echo -e "[user]\ndefault=$USER_NAME" >> /etc/wsl.conf

# add root priviledges for wheel group
echo; echo "Please uncomment %wheel ALL=(ALL) ALL"
read -p "Press ENTER to continue"
EDITOR=vim visudo

START_DIR=$(pwd)
chown $USER_NAME:$USER_NAME *
su -P -c "source ./install-yay.bash $START_DIR; source ./personalize-bash.bash" $USER_NAME

echo; read -p "Press ENTER to exit"
exit
