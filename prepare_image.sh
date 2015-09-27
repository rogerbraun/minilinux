#!/bin/sh

sudo umount linux-image-mnt

fallocate linux-image -l 1G
echo yes | mkfs.ext4 linux-image

mkdir -p linux-image-mnt
sudo mount linux-image linux-image-mnt
