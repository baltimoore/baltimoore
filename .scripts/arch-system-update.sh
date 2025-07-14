#!/bin/bash

echo "Updating package repositories..."
systemctl start reflector

#echo "Running pacman..."
#pacman -Syu
#
# I'm using Trizen as an AUR wrapper, which also wraps around pacman
echo "Running Trizen..."
trizen -Syu

echo "Checking if certain applications require post-install configuration..."
current_date=$(date +"%d%b%Y") 

# Check when GRUB was updated
grub_update_date=$(pacman -Qi grub \
    | grep "Install Date" | awk '{print $5 $6 $7}')
if [ "$grub_update_date" = "$current_date" ]; then
    echo "Updating GRUB installation and config..."

    # Find the /dev drive root is installed on
    # since in most cases, boot partitions are on the same drive as root
    current_drive=$(df / | awk 'NR==2 {print substr($1, 1, length($1)-1)}')

    # Do the MBR install
    sudo grub-install \
        --target=i386-pc \
        $current_drive

    # Generate the GRUB config
    sudo grub-mkconfig -o /boot/grub/grub.cfg
else
    echo "GRUB not updated; skipping reconfiguration"
fi

librewolf_install_date=$(pacman -Qi librewolf-bin \
    | grep "Install Date" | awk '{print $5 $6 $7}')
if [ "$librewolf_install_date" = "$current_date" ]; then
    # Custom call for the Librewolf browser config script
    exec wolfuck
else
    echo "Librewolf browser not updated; skipping reconfiguration"
fi

codium_install_date=$(pacman -Qi vscodium-bin \
    | grep "Install Date" | awk '{print $5 $6 $7}')
if [ "$codium_install_date" = "$current_date" ]; then
    # Custom call for the codium config script
    exec codifuck
else
    echo "VSCodium code editor not updated; skipping reconfiguration"
fi

