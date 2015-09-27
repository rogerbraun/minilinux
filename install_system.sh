#!/bin/sh

sudo mkdir -p linux-image-mnt/{sbin,bin,tmp,dev,proc,lib,usr/bin,usr/sbin,etc,root,home,service,sys,run,var/log}
sudo cp busybox/busybox linux-image-mnt/sbin
sudo cp install_system_in_chroot.sh linux-image-mnt/tmp
sudo mknod linux-image-mnt/dev/console c 5 1
sudo cp init-script.sh linux-image-mnt/sbin/init
sudo chroot linux-image-mnt /sbin/busybox ash /tmp/install_system_in_chroot.sh
sudo chmod +x linux-image-mnt/sbin/init
sudo cp -r service/* linux-image-mnt/service

sudo mkdir -p linux-image-mnt/usr/share/udhcpc
sudo cp udhcpc.script linux-image-mnt/usr/share/udhcpc/default.script

cd kernel
sudo INSTALL_MOD_PATH=../linux-image-mnt make modules_install
