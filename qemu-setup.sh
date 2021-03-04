#!/bin/bash
source qemu.config

echo "Where is the ISO located?"
echo "[default: $ISO]"
read -p "FULL PATH: " ISO

echo "What's should the name of"
echo "the .img file be?"
echo "[default: $FILE]"
read -p "" FILE

echo "RAM"
echo "[default: $RAM]"
read -p "" RAM

echo "SIZE"
echo "[default: $SIZE]"
read -p "" SIZE

echo "THREADS"
echo "[default: $THREADS]"
read -p "" THREADS  

#sudo mobprobe qxl bochs_drm

if [ CREATE -eq 1 ]
then
  qemu-img create -f qcow2 $FILE.img $SIZE
  qemu-system-x86_64 -enable-kvm -cdrom $ISO -boot menu=on \
    -drive file=$FILE.img -m $RAM -cpu host -smp $THREADS \
    -vga virtio -display sdl.gl=on 
fi
