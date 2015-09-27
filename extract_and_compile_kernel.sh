#!/bin/sh
mkdir -p kernel
tar xvaf sources/linux*.tar.xz -C kernel --strip-components=1

cd kernel
make clean
make defconfig
make
