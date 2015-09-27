#!/bin/sh
echo "I LIVE"

export PATH=/bin:/usr/bin:/sbin:/usr/sbin
/sbin/busybox --install
touch /etc/passwd /etc/group
adduser -D -u 0 root -s /bin/sh
echo "root:root" | chpasswd

echo "arisu" > /etc/hostname

dumpkmap > /var/keymap
