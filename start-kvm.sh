#!/bin/bash
source qemu.config

OS=Windows

while getopts ":s:-h" opt; do
  case $opt in
    h)
      echo "-s [SYSTEM] >> name of the screen used for the os"  
      echo "-h >> fucking guess."
      exit 1
      ;;
    s)
      OS=$OPTARG
      ;;
    \?)
      echo "Invalid option: -$OPTARG" >&2
      ;;
    :)
      echo "-f requires an file."
      echo "Parameter: -f /path/to/file"
      exit 1
      ;;
  esac
done

QEMUCMD= qemu-system-x86_64 -enable-kvm -boot menu=on \
    -drive file=$file.img -m $ram -cpu host -smp $threads \
    -vga virtio -display sdl.gl=on

screen -S $OS -s $QEMUCMD
