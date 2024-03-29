#!/bin/bash

# set timezone, locale
ln -sf /usr/share/zoneinfo/Asia/Ho_Chi_Minh /etc/localtime
hwclock --systohc
echo "en_US.UTF-8 UTF-8" > /etc/locale.gen
locale-gen
echo "LANG=en_US.UTF-8" > /etc/locale.conf

# set hostname
echo; read -p "Hostname: "
echo $REPLY > /etc/hostname

# purpose of an initramfs is to mount the root filesystem. The initramfs is a
# complete set of directories on a normal root filesystem. It is bundled into
# a single archive and compressed
# At boot time, the boot loader loads the kernel and the initramfs image into
# memory and starts the kernel. The kernel checks for the presence of the
# initramfs and, if found, mounts it as / and runs /init.
mkinitcpio -P

# change root password
echo; echo "Set root password"
passwd

# install grub
echo; echo "Install Grub"; # read -p "Root disk: "
# grub-install $REPLY
grub-install --target=x86_64-efi --efi-directory=/efi --bootloader-id=GRUB
grub-mkconfig -o /boot/grub/grub.cfg

# enable Hyper-V integration services
# systemctl hv_fcopy_daemon hv_kvp_daemon hv_vss_daemon

# enable NetworkManager
systemctl enable NetworkManager systemd-resolved

# ping needs to be able to create a raw network socket ~ privileged action
# add SUID (set owner user ID up on execution) permission for superuser's ping
chmod u+s $(which ping)

# enable gnome login manager (display manager)
systemctl enable gdm

# enable docker
systemctl enable docker containerd

# create user
echo; read -p "Username: " USER_NAME
useradd -m -G wheel,docker $USER_NAME
passwd $USER_NAME

# add root priviledges for wheel group
# echo; echo "Please uncomment %wheel ALL=(ALL) ALL"
# read -p "Press ENTER to continue"
# EDITOR=vim visudo
mkdir -p /etc/sudoers.d
echo '%wheel ALL=(ALL:ALL) ALL' > /etc/sudoers.d/allow-wheel

PERSONALIZE_PATH=$(eval echo "~$USER_NAME")/arch-install
cp -r /src $PERSONALIZE_PATH
chown -R $USER_NAME:$USER_NAME $PERSONALIZE_PATH
