#!/bin/sh

export PATH=/bin:/sbin:/usr/bin:/usr/sbin

mountpoint -q /proc || mount -t proc proc /proc -o nosuid,noexec,nodev
mountpoint -q /sys || mount -t sysfs sys /sys -o nosuid,noexec,nodev
mountpoint -q /run || mount -t tmpfs run /run -o mode=0755,nosuid,nodev
mountpoint -q /dev || mount -t devtmpfs dev /dev -o mode=0755,nosuid

mkdir -p -m0755 /run/runit /run/lock /run/lock/lvm /run/lvm /run/user /dev/pts /dev/shm
mountpoint -q /dev/pts || mount -n -t devpts devpts /dev/pts -o mode=0620,gid=5,nosuid,noexec
mountpoint -q /dev/shm || mount -n -t tmpfs shm /dev/shm -o mode=1777,nosuid,nodev

# Run mdev
touch /dev/mdev.seq
mdev -s

# Set keymap
loadkmap < /var/keymap

# Set hostname

hostname -F /etc/hostname

# Start runsvdir

exec runsvdir -P -s runit-signal /service
#exec /bin/ash
