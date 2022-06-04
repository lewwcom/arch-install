#!/bin/bash

# enable and start the first existing network synchronization service
timedatectl set-ntp true

# mount root, efi and enable swap
read -p "Root partition: "
mkfs -t ext4 $REPLY
mount $REPLY /mnt

read -p "Swap partition: "
mkswap $REPLY
swapon $REPLY

read -p "EFI partition: "
mkfs.fat -F 32 $REPLY
mkdir /mnt/efi
mount $REPLY /mnt/efi # Boot indirectly using boot loader

# install essential packages
VMWARE_AUXILIARY="open-vm-tools xf86-video-vmware xf86-input-vmmouse"
HYPERV_AUXILIARY="hyperv"
pacstrap /mnt base linux linux-firmware $VMWARE_AUXILIARY \
              grub efibootmgr $ESSENTIAL_PACKAGES \
              xorg gnome gnome-tweaks gnome-software-packagekit-plugin gnome-sound-recorder networkmanager sassc \
              ttf-croscore ttf-cascadia-code \
              docker docker-compose

# fstab define how block devices should be mounted into the file system
genfstab -U /mnt >> /mnt/etc/fstab

# run config script after chroot
mkdir /mnt/src
cp * .vimrc /mnt/src
arch-chroot /mnt bash /src/arch-config.bash

rm -rf /mnt/src
echo; echo "Remember to run personalize script in HOME/arch-install folder"
read -p "System will reboot after you press ENTER"
shutdown -r now

