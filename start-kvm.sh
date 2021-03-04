#!/bin/bash
source qemu.config

OS=Windows

QEMUCMD= 
  qemu-system-x86_64 -enable-kvm -boot menu=on \
    -drive file=$file.img -m $ram -cpu host -smp $threads \
    -vga virtio -display sdl.gl=on

screen -S $OS -s $QEMUCMD
