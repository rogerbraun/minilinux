#!/bin/sh
mkdir -p busybox
tar xvaf sources/busybox*.tar.bz2 -C busybox --strip-components=1

cd busybox
make clean
#make defconfig
LDFLAGS='--static' make

## DOESN'T WORK, USE DOWNLOAD FOR NOW

#wget http://busybox.net/downloads/binaries/latest/busybox-x86_64 -O busybox
