#!/bin/bash

if [ "$EUID" -ne 0 ]
then
    echo "Please run this script as super user"
fi

pacman -S libvirt qemu virt-manager dnsmasq screen

systemctl enable libvirtd
systemctl start libvirtd

addgroup libvirtd
usermod -G libvirtd -a server
