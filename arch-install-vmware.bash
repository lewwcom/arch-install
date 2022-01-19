#!/bin/bash

# enable and start the first existing network synchronization service
timedatectl set-ntp true

# mount root and swap
read -p "Root partition: "
mkfs -t ext4 $REPLY
mount $REPLY /mnt

read -p "Swap partition: "
mkswap $REPLY
swapon $REPLY

# install essential packages
VMWARE_AUXILIARY="open-vm-tools xf86-video-vmware xf86-input-vmmouse"
pacstrap /mnt base linux linux-firmware $VMWARE_AUXILIARY \
         grub $ESSENTIAL_PACKAGES \
         xorg gnome gnome-tweaks gnome-sound-recorder networkmanager sassc \
         ttf-croscore ttf-cascadia-code \
         firefox docker docker-compose

# fstab define how block devices should be mounted into the file system
genfstab -U /mnt >> /mnt/etc/fstab

# run config script after chroot
mkdir /mnt/src
cp * .vimrc /mnt/src
arch-chroot /mnt bash /src/arch-config.bash

rm -rf /mnt/src
echo "Remember to run personalize script in HOME/personalize folder"
read -p "System will reboot after you press ENTER"
shutdown -r now

